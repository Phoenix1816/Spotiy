using music;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using WMPLib;
using MySql.Data.MySqlClient;

#nullable disable

namespace SpotiyV2._0
{
    public partial class Form1 : Form
    {
        private MusicBar _musicBar;

        public static int CurrentKullaniciID { get; set; }

        private readonly WindowsMediaPlayer player = new WindowsMediaPlayer();
        private readonly string baglantiKodu = "Server=localhost;Database=MuzikApp;Uid=root;Pwd=;";

        public static int currentMuzikID { get; set; } = 1;

        private int minID = 1;
        private int maxID = 1;

        // Durum bayrakları
        private bool isShuffleOn = false;
        private bool isRepeatOn = false;

        // Ses
        private bool isMuted = false;
        private int savedVolume = 50;

        // Trackbar sürükleme
        private bool isDraggingProgress = false;

        // Play/Pause ikon
        private Image playIcon;
        private Image pauseIcon;

        // Shuffle random
        private static readonly Random _rnd = new Random();

        // LOOP BUG FIX
        private System.Windows.Forms.Timer repeatTimer;
        private string _currentFilePath = "";

        // ===========================
        // QUEUE MODE (ARTIST + PLAYLIST)
        // ===========================
        private List<int> _activeQueue = null;
        private int _activeQueueIndex = -1;

        private int _activeArtistId = 0;
        private int _activePlaylistId = 0;

        private bool IsQueueMode =>
            _activeQueue != null && _activeQueue.Count > 0 && _activeQueueIndex >= 0 &&
            (_activeArtistId > 0 || _activePlaylistId > 0);

        // ===========================
        // Artists UI
        // ===========================
        private FlowLayoutPanel flpArtists;

        public Form1()
        {
            InitializeComponent();

            _musicBar = new MusicBar();
            SayfaGetir(_musicBar);

            BindEventsSafely();
        }

        // ---------------------------
        // Event bağlama (çift tetiklenme fix)
        // + SES ÇUBUĞU GARANTİ EVENTLERİ (ValueChanged/MouseUp/MouseMove)
        // ---------------------------
        private void BindEventsSafely()
        {
            this.Load -= Form1_Load;
            this.Load += Form1_Load;

            this.FormClosed -= Form1_FormClosed;
            this.FormClosed += Form1_FormClosed;

            timer1.Tick -= timer1_Tick;
            timer1.Tick += timer1_Tick;

            player.PlayStateChange -= Player_PlayStateChange;
            player.PlayStateChange += Player_PlayStateChange;

            pictureBox1.Click -= pictureBox1_Click;
            pictureBox1.Click += pictureBox1_Click;

            pictureBox2.Click -= pictureBox2_Click;
            pictureBox2.Click += pictureBox2_Click;

            pictureBox3.Click -= pictureBox3_Click;
            pictureBox3.Click += pictureBox3_Click;

            pictureBox17.Click -= pictureBox17_Click;
            pictureBox17.Click += pictureBox17_Click;

            pictureBox18.Click -= pictureBox18_Click;
            pictureBox18.Click += pictureBox18_Click;

            pictureBox15.Click -= pictureBox15_Click;
            pictureBox15.Click += pictureBox15_Click;

            trackBar1.MouseDown -= trackBar1_MouseDown;
            trackBar1.MouseDown += trackBar1_MouseDown;

            trackBar1.MouseUp -= trackBar1_MouseUp;
            trackBar1.MouseUp += trackBar1_MouseUp;

            // ✅ SES: sadece Scroll yetmeyebilir → garanti eventler
            trackBar2.Scroll -= trackBar2_Scroll;
            trackBar2.Scroll += trackBar2_Scroll;

            trackBar2.ValueChanged -= trackBar2_ValueChanged;
            trackBar2.ValueChanged += trackBar2_ValueChanged;

            trackBar2.MouseUp -= trackBar2_MouseUp;
            trackBar2.MouseUp += trackBar2_MouseUp;

            trackBar2.MouseMove -= trackBar2_MouseMove;
            trackBar2.MouseMove += trackBar2_MouseMove;

            pictureBox16.Click -= pictureBox16_Click;
            pictureBox16.Click += pictureBox16_Click;

            pictureBox27.Click -= pictureBox27_Click;
            pictureBox27.Click += pictureBox27_Click;

            panel3.Click -= panel3_Click;
            panel3.Click += panel3_Click;
        }

        // ---------------------------
        // FORM LOAD
        // ---------------------------
        private void Form1_Load(object sender, EventArgs e)
        {
            LoadMinMaxMuzikId();
            LoadCurrentUserInfo();

            try
            {
                pictureBox4.Visible = true;
                pictureBox4.BringToFront();
                pictureBox4.SizeMode = PictureBoxSizeMode.StretchImage;
                pictureBox4.BackColor = Color.FromArgb(26, 26, 26);
            }
            catch { }

            timer1.Interval = 1000;

            playIcon = Properties.Resources.PlayIcon;
            pauseIcon = Properties.Resources.PauseIcon;
            pictureBox1.Image = playIcon;
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;

            trackBar1.Minimum = 0;
            trackBar1.Maximum = 100;
            trackBar1.Value = 0;
            trackBar1.TickStyle = TickStyle.None;

            // ✅ Ses barı init
            trackBar2.Minimum = 0;
            trackBar2.Maximum = 100;
            trackBar2.TickStyle = TickStyle.None;

            // player volume 0-100
            int initVol = player.settings.volume;
            if (initVol < 0) initVol = 0;
            if (initVol > 100) initVol = 100;

            trackBar2.Value = initVol;
            savedVolume = initVol;

            // ✅ ilk açılışta da uygula (bazı durumlarda value set edilir ama WMP volume değişmemiş olabilir)
            ApplyVolumeFromTrackBar();

            label19.Text = "0:00";
            label20.Text = "--:--";

            pictureBox17.Cursor = Cursors.Hand;
            pictureBox18.Cursor = Cursors.Hand;
            AddHoverEffect(pictureBox17);
            AddHoverEffect(pictureBox18);
            UpdateToggleIcons();

            if (repeatTimer == null)
            {
                repeatTimer = new System.Windows.Forms.Timer();
                repeatTimer.Interval = 120;
                repeatTimer.Tick += RepeatTimer_Tick;
            }

            if (currentMuzikID < minID || currentMuzikID > maxID)
                currentMuzikID = minID;

            LoadArtistsIntoPanel14();

            PlayTrackById(currentMuzikID, autoPlay: false);
            pictureBox1.Image = playIcon;
            timer1.Stop();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            try
            {
                timer1.Stop();
                repeatTimer?.Stop();
                player.PlayStateChange -= Player_PlayStateChange;
                SafeSetPictureBoxImage(pictureBox4, null);
                SafeSetPictureBoxImage(pictureBox8, null);
            }
            catch { }
        }

        // ---------------------------
        // GDI leak fix
        // ---------------------------
        private void SafeSetPictureBoxImage(PictureBox pb, Image img)
        {
            if (pb == null) return;
            try
            {
                var old = pb.Image;
                pb.Image = null;
                old?.Dispose();
            }
            catch { }
            pb.Image = img;
        }

        // ---------------------------
        // DIŞTAN ÇAL
        // ---------------------------
        public void PlayFromExternal(int muzikId)
        {
            _activeQueue = null;
            _activeQueueIndex = -1;
            _activeArtistId = 0;
            _activePlaylistId = 0;
            PlayTrackById(muzikId, autoPlay: true);
        }

        // ---------------------------
        // ✅ TEK ŞARKI ÇAL (Sanatçı listesinde tıklama için)
        // ---------------------------
        public void PlaySingleSong(int muzikId)
        {
            // tek şarkı çalarken queue modunu kapat
            _activeQueue = null;
            _activeQueueIndex = -1;
            _activeArtistId = 0;
            _activePlaylistId = 0;

            PlayTrackById(muzikId, autoPlay: true);
        }

        // ---------------------------
        // ARTISTS
        // ---------------------------
        private class ArtistRow
        {
            public int Id { get; set; }
            public string AdSoyad { get; set; }
            public string PhotoPath { get; set; }
        }

        private void EnsureArtistsContainer()
        {
            if (flpArtists != null) return;

            panel14.Controls.Clear();
            panel14.BackColor = Color.Transparent;
            panel14.AutoScroll = true;

            flpArtists = new FlowLayoutPanel
            {
                Dock = DockStyle.Fill,
                AutoScroll = true,
                WrapContents = true,
                FlowDirection = FlowDirection.LeftToRight,
                Padding = new Padding(12),
                BackColor = Color.Transparent
            };

            flpArtists.ControlAdded += (s, e) => e.Control.Margin = new Padding(12);
            panel14.Controls.Add(flpArtists);
        }

        private Control CreateArtistCard(ArtistRow a)
        {
            var card = new Panel
            {
                Width = 230,
                Height = 300,
                BackColor = Color.FromArgb(35, 35, 35),
                Cursor = Cursors.Hand
            };

            var pic = new PictureBox
            {
                Width = 200,
                Height = 200,
                Location = new Point(15, 15),
                SizeMode = PictureBoxSizeMode.StretchImage,
                BackColor = Color.FromArgb(26, 26, 26)
            };

            var lblName = new Label
            {
                AutoSize = false,
                Width = card.Width - 30,
                Height = 32,
                Location = new Point(15, 225),
                TextAlign = ContentAlignment.MiddleLeft,
                Font = new Font("Elephant", 11F),
                ForeColor = Color.White,
                Text = string.IsNullOrWhiteSpace(a.AdSoyad) ? "Bilinmiyor" : a.AdSoyad
            };

            var lblSub = new Label
            {
                AutoSize = false,
                Width = card.Width - 30,
                Height = 22,
                Location = new Point(15, 257),
                TextAlign = ContentAlignment.MiddleLeft,
                Font = new Font("Elephant", 8.5F),
                ForeColor = SystemColors.ButtonShadow,
                Text = "Sanatçı"
            };

            try
            {
                if (!string.IsNullOrWhiteSpace(a.PhotoPath))
                {
                    string full = ResolvePhotoPath(a.PhotoPath);
                    if (!string.IsNullOrWhiteSpace(full) && File.Exists(full))
                        pic.ImageLocation = full;
                }
            }
            catch { }

            card.MouseEnter += (s, e) => card.BackColor = Color.FromArgb(45, 45, 45);
            card.MouseLeave += (s, e) => card.BackColor = Color.FromArgb(35, 35, 35);

            void openArtist(object s, EventArgs e)
            {
                Sanatçı.SelectedArtistId = a.Id;
                using (var da = new Sanatçı())
                {
                    this.Hide();
                    da.ShowDialog(this);
                    this.Show();
                    this.Activate();
                }
            }

            card.Click += openArtist;
            pic.Click += openArtist;
            lblName.Click += openArtist;
            lblSub.Click += openArtist;

            card.Controls.Add(pic);
            card.Controls.Add(lblName);
            card.Controls.Add(lblSub);

            return card;
        }

        private void LoadArtistsIntoPanel14()
        {
            EnsureArtistsContainer();
            flpArtists.Controls.Clear();

            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();
                    const string sql = @"
SELECT KullaniciID, AdSoyad, userPhoto
FROM kullanicilar
WHERE Rol = 2 AND Durum = 1
ORDER BY AdSoyad;";
                    using (var cmd = new MySqlCommand(sql, conn))
                    using (var r = cmd.ExecuteReader())
                    {
                        int count = 0;
                        while (r.Read())
                        {
                            var a = new ArtistRow
                            {
                                Id = r["KullaniciID"] == DBNull.Value ? 0 : Convert.ToInt32(r["KullaniciID"]),
                                AdSoyad = r["AdSoyad"]?.ToString() ?? "",
                                PhotoPath = r["userPhoto"]?.ToString() ?? ""
                            };
                            flpArtists.Controls.Add(CreateArtistCard(a));
                            count++;
                        }

                        if (count == 0)
                        {
                            flpArtists.Controls.Add(new Label
                            {
                                Height = 40,
                                ForeColor = SystemColors.ButtonShadow,
                                Font = new Font("Elephant", 9F),
                                Text = "Aktif sanatçı bulunamadı."
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                flpArtists.Controls.Add(new Label
                {
                    Height = 60,
                    ForeColor = Color.IndianRed,
                    Font = new Font("Elephant", 9F),
                    Text = "Sanatçıları çekerken hata:\n" + ex.Message
                });
            }
        }

        // ---------------------------
        // PATH RESOLVE
        // ---------------------------
        private string ResolvePhotoPath(string raw)
        {
            if (string.IsNullOrWhiteSpace(raw)) return "";
            string p = raw.Trim().Trim('"').Replace('/', '\\').TrimStart('\\');

            if (Path.IsPathRooted(p)) return p;

            string exeDir = Application.StartupPath;
            string tryExe = Path.Combine(exeDir, p);
            if (File.Exists(tryExe)) return tryExe;

            string baseDir = AppDomain.CurrentDomain.BaseDirectory;
            string tryBase = Path.Combine(baseDir, p);
            if (File.Exists(tryBase)) return tryBase;

            string projectRoot = Directory.GetParent(baseDir)?.Parent?.Parent?.FullName;
            if (!string.IsNullOrWhiteSpace(projectRoot))
            {
                string tryRoot = Path.Combine(projectRoot, p);
                if (File.Exists(tryRoot)) return tryRoot;
            }

            return "";
        }

        // ✅ GENEL PATH (music + pictures için daha doğru)
        private string ResolveAnyPath(string raw)
        {
            if (string.IsNullOrWhiteSpace(raw)) return "";

            string p = raw.Trim().Trim('"')
                          .Replace('/', '\\')
                          .TrimStart('\\');

            if (Path.IsPathRooted(p)) return p;

            string exeDir = Application.StartupPath;
            string tryExe = Path.Combine(exeDir, p);
            if (File.Exists(tryExe)) return tryExe;

            string baseDir = AppDomain.CurrentDomain.BaseDirectory;
            string tryBase = Path.Combine(baseDir, p);
            if (File.Exists(tryBase)) return tryBase;

            string projectRoot = Directory.GetParent(baseDir)?.Parent?.Parent?.FullName;
            if (!string.IsNullOrWhiteSpace(projectRoot))
            {
                string tryRoot = Path.Combine(projectRoot, p);
                if (File.Exists(tryRoot)) return tryRoot;
            }

            return "";
        }

        // ---------------------------
        // USER INFO
        // ---------------------------
        private void LoadCurrentUserInfo()
        {
            if (CurrentKullaniciID <= 0) return;

            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();
                    const string sql = "SELECT AdSoyad, userPhoto FROM kullanicilar WHERE KullaniciID=@id LIMIT 1";
                    using (var cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", CurrentKullaniciID);
                        using (var r = cmd.ExecuteReader())
                        {
                            if (!r.Read()) return;

                            label1.Text = r["AdSoyad"]?.ToString() ?? "Bilinmiyor";
                            string photoRel = r["userPhoto"]?.ToString() ?? "";

                            if (string.IsNullOrWhiteSpace(photoRel)) return;
                            string fullPath = ResolvePhotoPath(photoRel);
                            if (!string.IsNullOrWhiteSpace(fullPath) && File.Exists(fullPath))
                            {
                                using (var bmpTemp = new Bitmap(fullPath))
                                {
                                    SafeSetPictureBoxImage(pictureBox4, new Bitmap(bmpTemp));
                                }
                            }
                        }
                    }
                }
            }
            catch { }
        }

        // ---------------------------
        // VOLUME (✅ FIX)
        // ---------------------------
        private void ApplyVolumeFromTrackBar()
        {
            int v = Math.Max(0, Math.Min(100, trackBar2.Value));
            player.settings.volume = v;
            savedVolume = v;
            isMuted = (v == 0);
        }

        private void trackBar2_Scroll(object sender, EventArgs e) => ApplyVolumeFromTrackBar();

        // ✅ Scroll gelmezse bunlar yakalar
        private void trackBar2_ValueChanged(object sender, EventArgs e) => ApplyVolumeFromTrackBar();
        private void trackBar2_MouseUp(object sender, MouseEventArgs e) => ApplyVolumeFromTrackBar();

        private void trackBar2_MouseMove(object sender, MouseEventArgs e)
        {
            if ((e.Button & MouseButtons.Left) == MouseButtons.Left)
                ApplyVolumeFromTrackBar();
        }

        // ---------------------------
        // LOOP FIX TIMER
        // ---------------------------
        private void RepeatTimer_Tick(object sender, EventArgs e)
        {
            repeatTimer.Stop();
            try
            {
                if (string.IsNullOrWhiteSpace(_currentFilePath))
                {
                    PlayTrackById(currentMuzikID, autoPlay: true);
                    return;
                }
                player.controls.stop();
                player.URL = "";
                player.URL = _currentFilePath;
                player.controls.play();
                timer1.Start();
                pictureBox1.Image = pauseIcon;
            }
            catch { }
        }

        // ---------------------------
        // FAVORİLER
        // ---------------------------
        private int GetOrCreateUserFavorilerListeId(MySqlConnection conn, int kullaniciId)
        {
            using (var cmd = new MySqlCommand(@"
SELECT ListeID FROM listeler WHERE KullaniciID=@uid AND Ad='Favoriler' LIMIT 1;", conn))
            {
                cmd.Parameters.AddWithValue("@uid", kullaniciId);
                object val = cmd.ExecuteScalar();
                if (val != null && val != DBNull.Value)
                    return Convert.ToInt32(val);
            }

            using (var ins = new MySqlCommand(@"
INSERT INTO listeler (KullaniciID, Ad, Gorunurluk)
VALUES (@uid, 'Favoriler', 1);", conn))
            {
                ins.Parameters.AddWithValue("@uid", kullaniciId);
                ins.ExecuteNonQuery();
            }

            using (var idCmd = new MySqlCommand("SELECT LAST_INSERT_ID();", conn))
            {
                object newId = idCmd.ExecuteScalar();
                return (newId == null || newId == DBNull.Value) ? 0 : Convert.ToInt32(newId);
            }
        }

        private void AddSelectedSongToFavorites()
        {
            if (CurrentKullaniciID <= 0 || currentMuzikID <= 0)
            {
                MessageBox.Show("Önce giriş yapmalı ve şarkı seçmelisin.");
                return;
            }

            try
            {
                using var conn = new MySqlConnection(baglantiKodu);
                conn.Open();

                int favorilerListeId = GetOrCreateUserFavorilerListeId(conn, CurrentKullaniciID);
                if (favorilerListeId <= 0)
                {
                    MessageBox.Show("Favoriler listesi oluşturulamadı.");
                    return;
                }

                using (var check = new MySqlCommand(@"
SELECT 1 FROM playlistmuzik
WHERE ListeID=@lid AND MuzikID=@mid AND KullaniciID=@uid LIMIT 1;", conn))
                {
                    check.Parameters.AddWithValue("@lid", favorilerListeId);
                    check.Parameters.AddWithValue("@mid", currentMuzikID);
                    check.Parameters.AddWithValue("@uid", CurrentKullaniciID);
                    if (check.ExecuteScalar() != null)
                    {
                        MessageBox.Show("Bu şarkı zaten Favorilerinde.");
                        return;
                    }
                }

                int siraNo;
                using (var siraCmd = new MySqlCommand(@"
SELECT IFNULL(MAX(SiraNo),0)+1 FROM playlistmuzik
WHERE ListeID=@lid AND KullaniciID=@uid;", conn))
                {
                    siraCmd.Parameters.AddWithValue("@lid", favorilerListeId);
                    siraCmd.Parameters.AddWithValue("@uid", CurrentKullaniciID);
                    siraNo = Convert.ToInt32(siraCmd.ExecuteScalar());
                }

                using (var ins = new MySqlCommand(@"
INSERT INTO playlistmuzik (ListeID, MuzikID, KullaniciID, SiraNo)
VALUES (@lid, @mid, @uid, @sira);", conn))
                {
                    ins.Parameters.AddWithValue("@lid", favorilerListeId);
                    ins.Parameters.AddWithValue("@mid", currentMuzikID);
                    ins.Parameters.AddWithValue("@uid", CurrentKullaniciID);
                    ins.Parameters.AddWithValue("@sira", siraNo);
                    ins.ExecuteNonQuery();
                }

                MessageBox.Show("Favorilere eklendi ❤️");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Favoriye eklerken hata: " + ex.Message);
            }
        }

        private void pictureBox15_Click(object sender, EventArgs e) => AddSelectedSongToFavorites();

        // ---------------------------
        // QUEUE API
        // ---------------------------
        public void StartArtistPlayback(int artistId, int startMuzikId)
        {
            try
            {
                var queue = LoadArtistQueue(artistId);
                if (queue == null || queue.Count == 0)
                {
                    MessageBox.Show("Bu sanatçının şarkısı yok.");
                    return;
                }

                _activeArtistId = artistId;
                _activePlaylistId = 0;
                _activeQueue = queue;

                int idx = _activeQueue.IndexOf(startMuzikId);
                _activeQueueIndex = (idx >= 0) ? idx : 0;

                PlayTrackById(_activeQueue[_activeQueueIndex], autoPlay: true);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Sanatçı çalma hatası: " + ex.Message);
            }
        }

        private List<int> LoadArtistQueue(int artistId)
        {
            var list = new List<int>();
            using (var conn = new MySqlConnection(baglantiKodu))
            {
                conn.Open();
                const string sql = @"SELECT MuzikID FROM muzikler WHERE SanatciID=@id ORDER BY Tarih DESC;";
                using (var cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", artistId);
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                            if (r["MuzikID"] != DBNull.Value)
                                list.Add(Convert.ToInt32(r["MuzikID"]));
                    }
                }
            }
            return list;
        }

        public void StartPlaylistPlayback(int listeId, int startMuzikId)
        {
            try
            {
                var queue = LoadPlaylistQueue(listeId);
                if (queue == null || queue.Count == 0)
                {
                    MessageBox.Show("Playlist boş.");
                    return;
                }

                _activePlaylistId = listeId;
                _activeArtistId = 0;
                _activeQueue = queue;

                int idx = _activeQueue.IndexOf(startMuzikId);
                _activeQueueIndex = (idx >= 0) ? idx : 0;

                PlayTrackById(_activeQueue[_activeQueueIndex], autoPlay: true);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Playlist çalma hatası: " + ex.Message);
            }
        }

        private List<int> LoadPlaylistQueue(int listeId)
        {
            var list = new List<int>();
            using (var conn = new MySqlConnection(baglantiKodu))
            {
                conn.Open();
                const string sql = @"
SELECT pm.MuzikID FROM playlistmuzik pm
INNER JOIN muzikler m ON m.MuzikID = pm.MuzikID
WHERE pm.ListeID=@lid ORDER BY pm.SiraNo;";
                using (var cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@lid", listeId);
                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                            if (r["MuzikID"] != DBNull.Value)
                                list.Add(Convert.ToInt32(r["MuzikID"]));
                    }
                }
            }
            return list;
        }

        private int GetNextFromQueue()
        {
            if (!IsQueueMode) return -1;
            if (isShuffleOn)
            {
                _activeQueueIndex = _rnd.Next(0, _activeQueue.Count);
                return _activeQueue[_activeQueueIndex];
            }
            _activeQueueIndex++;
            if (_activeQueueIndex >= _activeQueue.Count) _activeQueueIndex = 0;
            return _activeQueue[_activeQueueIndex];
        }

        private int GetPrevFromQueue()
        {
            if (!IsQueueMode) return -1;
            _activeQueueIndex--;
            if (_activeQueueIndex < 0) _activeQueueIndex = _activeQueue.Count - 1;
            return _activeQueue[_activeQueueIndex];
        }

        // ---------------------------
        // TOGGLES
        // ---------------------------
        private void pictureBox17_Click(object sender, EventArgs e)
        {
            isShuffleOn = !isShuffleOn;
            UpdateToggleIcons();
        }

        private void pictureBox18_Click(object sender, EventArgs e)
        {
            isRepeatOn = !isRepeatOn;
            UpdateToggleIcons();
        }

        private void UpdateToggleIcons()
        {
            pictureBox17.Image = isShuffleOn ? Properties.Resources.RandomActive : Properties.Resources.RandomPassive;
            pictureBox18.Image = isRepeatOn ? Properties.Resources.LoopActive : Properties.Resources.LoopPassive;
            pictureBox17.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox18.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void AddHoverEffect(PictureBox pb)
        {
            pb.MouseEnter += (s, e) => pb.BackColor = Color.FromArgb(35, 35, 35);
            pb.MouseLeave += (s, e) => pb.BackColor = Color.Transparent;
        }

        // ---------------------------
        // PLAY TRACK
        // ---------------------------
        private void PlayTrackById(int id, bool autoPlay = true)
        {
            string token = "";
            string pictures = "";
            string sarkiAdi = "Bilinmiyor";
            string sanatciAdi = "Bilinmiyor";

            using (var baglanti = new MySqlConnection(baglantiKodu))
            {
                try
                {
                    baglanti.Open();
                    const string sql = "SELECT UrlToken, pictures, SarkiAdi, SanatciAdi FROM Muzikler WHERE MuzikID=@id LIMIT 1";
                    using (var cmd = new MySqlCommand(sql, baglanti))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (var r = cmd.ExecuteReader())
                        {
                            if (!r.Read()) return;
                            token = r["UrlToken"]?.ToString() ?? "";
                            pictures = r["pictures"]?.ToString() ?? "";
                            sarkiAdi = r["SarkiAdi"]?.ToString() ?? "Bilinmiyor";
                            sanatciAdi = r["SanatciAdi"]?.ToString() ?? "Bilinmiyor";
                        }
                    }
                }
                catch { return; }
            }

            label5.Text = sarkiAdi;
            label6.Text = sanatciAdi;

            if (!string.IsNullOrEmpty(pictures))
            {
                // ✅ cover path artık genel resolver
                string resimYolu = ResolveAnyPath(pictures);
                if (!string.IsNullOrEmpty(resimYolu) && File.Exists(resimYolu))
                {
                    SafeSetPictureBoxImage(pictureBox8, Image.FromFile(resimYolu));
                    pictureBox8.SizeMode = PictureBoxSizeMode.StretchImage;
                }
                else SafeSetPictureBoxImage(pictureBox8, null);
            }
            else SafeSetPictureBoxImage(pictureBox8, null);

            if (!string.IsNullOrEmpty(token))
            {
                // ✅ müzik path artık genel resolver (ASIL FIX)
                string muzikYolu = ResolveAnyPath(token);

                _currentFilePath = muzikYolu;
                currentMuzikID = id;

                if (string.IsNullOrWhiteSpace(muzikYolu) || !File.Exists(muzikYolu))
                {
                    MessageBox.Show("Müzik dosyası bulunamadı:\n" + muzikYolu);
                    return;
                }

                player.URL = muzikYolu;

                if (autoPlay)
                {
                    player.controls.play();
                    timer1.Start();
                    pictureBox1.Image = pauseIcon;
                }
                else
                {
                    player.controls.stop();
                    timer1.Stop();
                    pictureBox1.Image = playIcon;
                    label19.Text = "0:00";
                    label20.Text = "--:--";
                    try { trackBar1.Value = 0; } catch { }
                }
            }

            _musicBar?.UpdateInfo(currentMuzikID);
        }

        private string FormatTime(int seconds) =>
            TimeSpan.FromSeconds(seconds).ToString(@"m\:ss");

        // ---------------------------
        // TIMER
        // ---------------------------
        private void timer1_Tick(object sender, EventArgs e)
        {
            if (player.playState != WMPPlayState.wmppsPlaying || player.currentMedia == null) return;
            if (isDraggingProgress) return;

            int max = (int)player.currentMedia.duration;
            if (max <= 0) return;

            if (trackBar1.Maximum != max)
            {
                trackBar1.Maximum = max;
                label20.Text = FormatTime(max);
            }

            int pos = (int)player.controls.currentPosition;
            pos = Math.Max(0, Math.Min(max, pos));

            try { trackBar1.Value = pos; } catch { }
            label19.Text = FormatTime(pos);
        }

        // ---------------------------
        // PLAY / PAUSE
        // ---------------------------
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (player.playState == WMPPlayState.wmppsPlaying)
            {
                player.controls.pause();
                pictureBox1.Image = playIcon;
                timer1.Stop();
            }
            else
            {
                if (string.IsNullOrEmpty(player.URL))
                    PlayTrackById(currentMuzikID, autoPlay: true);

                player.controls.play();
                timer1.Start();
                pictureBox1.Image = pauseIcon;
            }
        }

        // ---------------------------
        // TRACKBAR
        // ---------------------------
        private void trackBar1_MouseDown(object sender, MouseEventArgs e) => isDraggingProgress = true;

        private void trackBar1_MouseUp(object sender, MouseEventArgs e)
        {
            isDraggingProgress = false;
            if (player.currentMedia != null)
            {
                player.controls.currentPosition = trackBar1.Value;
                label19.Text = FormatTime(trackBar1.Value);
            }
        }

        // ---------------------------
        // NEXT / PREV
        // ---------------------------
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            if (IsQueueMode)
            {
                int nextId = GetNextFromQueue();
                if (nextId > 0) PlayTrackById(nextId, autoPlay: true);
                return;
            }

            int nextID = isShuffleOn ? _rnd.Next(minID, maxID + 1) : currentMuzikID + 1;
            if (nextID > maxID) nextID = minID;
            PlayTrackById(nextID, autoPlay: true);
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            if (IsQueueMode)
            {
                int prevId = GetPrevFromQueue();
                if (prevId > 0) PlayTrackById(prevId, autoPlay: true);
                return;
            }

            int prevID = currentMuzikID - 1;
            if (prevID < minID) prevID = maxID;
            PlayTrackById(prevID, autoPlay: true);
        }

        // ---------------------------
        // WMP STATE
        // ---------------------------
        private void Player_PlayStateChange(int NewState)
        {
            if (NewState != (int)WMPPlayState.wmppsMediaEnded) return;

            if (isRepeatOn)
            {
                repeatTimer.Stop();
                repeatTimer.Start();
                return;
            }

            if (IsQueueMode)
            {
                int nextId = GetNextFromQueue();
                if (nextId > 0) PlayTrackById(nextId, autoPlay: true);
                return;
            }

            int nextID = isShuffleOn ? _rnd.Next(minID, maxID + 1) : currentMuzikID + 1;
            if (nextID > maxID) nextID = minID;
            PlayTrackById(nextID, autoPlay: true);
        }

        // ---------------------------
        // DB: MIN / MAX
        // ---------------------------
        private void LoadMinMaxMuzikId()
        {
            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();
                    using (var cmd = new MySqlCommand("SELECT MIN(MuzikID), MAX(MuzikID) FROM Muzikler", conn))
                    using (var r = cmd.ExecuteReader())
                    {
                        if (r.Read())
                        {
                            minID = r.IsDBNull(0) ? 1 : r.GetInt32(0);
                            maxID = r.IsDBNull(1) ? minID : r.GetInt32(1);
                            if (maxID < minID) maxID = minID;
                        }
                    }
                }
            }
            catch { minID = maxID = 1; }
        }

        // ---------------------------
        // NAVIGATION
        // ---------------------------
        private void pictureBox16_Click(object sender, EventArgs e)
        {
            using (var da = new DefaultAyarlar())
            {
                da.Owner = this;
                this.Hide();
                da.ShowDialog();
                this.Show();
                this.Activate();
            }
        }

        private void pictureBox27_Click(object sender, EventArgs e)
        {
            using (var da = new AboutUs())
            {
                da.Owner = this;
                this.Hide();
                da.ShowDialog();
                this.Show();
                this.Activate();
            }
        }

        private void panel3_Click(object sender, EventArgs e)
        {
            using (var se = new Favoriler())
            {
                se.Owner = this;
                this.Hide();
                se.ShowDialog();
                this.Show();
                this.Activate();
            }
        }

        private void SayfaGetir(UserControl sayfa)
        {
            panel13.Controls.Clear();
            sayfa.Dock = DockStyle.Fill;
            panel13.Controls.Add(sayfa);
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {
            using (var se = new Favoriler())
            {
                se.Owner = this;
                this.Hide();
                se.ShowDialog();
                this.Show();
                this.Activate();
            }
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            using (var se = new Favoriler())
            {
                se.Owner = this;
                this.Hide();
                se.ShowDialog();
                this.Show();
                this.Activate();
            }
        }
    }

    // ---------------------------
    // MENU RENDERER
    // ---------------------------
    public class SpotifyMenuRenderer : ToolStripProfessionalRenderer
    {
        private readonly Color bgColor = Color.FromArgb(25, 25, 25);
        private readonly Color hoverColor = Color.FromArgb(255, 187, 0);
        private readonly Color textColor = Color.White;
        private readonly Color hoverTextColor = Color.Black;

        protected override void OnRenderToolStripBackground(ToolStripRenderEventArgs e)
        {
            e.Graphics.Clear(bgColor);
        }

        protected override void OnRenderMenuItemBackground(ToolStripItemRenderEventArgs e)
        {
            Rectangle rect = new Rectangle(Point.Empty, e.Item.Size);
            using (SolidBrush brush = new SolidBrush(e.Item.Selected ? hoverColor : bgColor))
                e.Graphics.FillRectangle(brush, rect);
        }

        protected override void OnRenderItemText(ToolStripItemTextRenderEventArgs e)
        {
            e.TextColor = e.Item.Selected ? hoverTextColor : textColor;
            base.OnRenderItemText(e);
        }

        protected override void OnRenderSeparator(ToolStripSeparatorRenderEventArgs e)
        {
            using (Pen pen = new Pen(Color.FromArgb(45, 45, 45)))
            {
                int y = e.Item.Bounds.Height / 2;
                e.Graphics.DrawLine(pen, 10, y, e.Item.Bounds.Width - 10, y);
            }
        }
    }
}
