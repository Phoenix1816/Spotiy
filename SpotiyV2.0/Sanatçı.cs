#nullable disable
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace SpotiyV2._0
{
    public partial class Sanatçı : Form
    {
        // ✅ Form1'den seçilen sanatçı (kullanicilar.KullaniciID)
        public static int SelectedArtistId { get; set; } = 0;

        private readonly string baglantiKodu = "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        private const int PanelRadius = 20;
        private const int PictureRadius = 20;
        private const int RichTextRadius = 18;

        private Panel _topHeaderPanel;
        private FlowLayoutPanel flpSongs;

        // ✅ flpSongs resize event’i 1 kere bağlamak için
        private bool _songsSizeHooked = false;

        public Sanatçı()
        {
            InitializeComponent();
            BindEventsSafely();
        }

        private void BindEventsSafely()
        {
            this.Load -= Sanatçı_Load;
            this.Load += Sanatçı_Load;

            this.Resize -= Sanatçı_Resize;
            this.Resize += Sanatçı_Resize;

            this.FormClosed -= Sanatçı_FormClosed;
            this.FormClosed += Sanatçı_FormClosed;

            // Navigation ikonları designer’da bağlı olabilir, garantiye alalım:
            pictureBox4.Click -= pictureBox4_Click;
            pictureBox4.Click += pictureBox4_Click;

            pictureBox3.Click -= pictureBox3_Click;
            pictureBox3.Click += pictureBox3_Click;

            pictureBox5.Click -= pictureBox5_Click;
            pictureBox5.Click += pictureBox5_Click;
        }

        private void Sanatçı_Load(object sender, EventArgs e)
        {
            _topHeaderPanel = panel3;

            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox2.SizeMode = PictureBoxSizeMode.StretchImage;
            richTextBox1.ReadOnly = true;

            EnsureSongsContainer();
            LoadSelectedArtistPage();

            ApplyRoundedToAll();
        }

        private void Sanatçı_Resize(object sender, EventArgs e)
        {
            ApplyRoundedToAll();
        }

        private void Sanatçı_FormClosed(object sender, FormClosedEventArgs e)
        {
            // ✅ Image dispose (GDI leak fix)
            try
            {
                DisposePictureBoxImage(pictureBox1);
                DisposeAllSongRowImages();
            }
            catch { }
        }

        private void DisposePictureBoxImage(PictureBox pb)
        {
            if (pb == null) return;
            try
            {
                var old = pb.Image;
                pb.Image = null;
                old?.Dispose();
            }
            catch { }
        }

        private void DisposeAllSongRowImages()
        {
            if (flpSongs == null) return;

            foreach (Control c in flpSongs.Controls)
            {
                if (c is Panel row)
                {
                    foreach (Control child in row.Controls)
                    {
                        if (child is PictureBox pb)
                            DisposePictureBoxImage(pb);
                    }
                }
            }
        }

        private void EnsureSongsContainer()
        {
            if (flpSongs != null) return;

            panel2.Controls.Clear();
            panel2.BackColor = Color.Transparent;
            panel2.AutoScroll = true;

            flpSongs = new FlowLayoutPanel
            {
                Name = "flpSongs",
                Dock = DockStyle.Fill,
                AutoScroll = true,
                FlowDirection = FlowDirection.TopDown,
                WrapContents = false,
                Padding = new Padding(10),
                BackColor = Color.Transparent
            };

            panel2.Controls.Add(flpSongs);

            // ✅ yalnızca 1 kez: içerideki row genişliklerini düzelt
            if (!_songsSizeHooked)
            {
                _songsSizeHooked = true;
                flpSongs.SizeChanged += (s, e) =>
                {
                    foreach (Control ctrl in flpSongs.Controls)
                    {
                        if (ctrl is Panel row)
                        {
                            try { row.Width = flpSongs.ClientSize.Width - 25; } catch { }
                        }
                    }
                };
            }
        }

        private void LoadSelectedArtistPage()
        {
            EnsureSongsContainer();

            if (SelectedArtistId <= 0)
            {
                label1.Text = "Sanatçı bulunamadı";
                label2.Text = "Şarkı Sayısı: 0";
                richTextBox1.Text = "Sanatçı seçilmedi.";
                DisposePictureBoxImage(pictureBox1);

                flpSongs.Controls.Clear();
                flpSongs.Controls.Add(BuildInfoLabel("Sanatçı seçilmedi."));
                return;
            }

            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();

                    // ✅ FIX: sanatcilar.SanatciID'yi de alıyoruz
                    const string sqlArtist = @"
SELECT 
    k.AdSoyad,
    k.userPhoto,
    s.SanatciID,
    s.SarkiSayisi,
    s.Biyografi
FROM kullanicilar k
LEFT JOIN sanatcilar s ON s.KullaniciID = k.KullaniciID
WHERE k.KullaniciID = @id
LIMIT 1;";

                    string adSoyad = "Bilinmiyor";
                    string photo = "";
                    object sarkiSayisiObj = null;
                    string bio = "";
                    int sanatciId = 0;

                    using (var cmd = new MySqlCommand(sqlArtist, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", SelectedArtistId);
                        using (var r = cmd.ExecuteReader())
                        {
                            if (!r.Read())
                            {
                                label1.Text = "Sanatçı bulunamadı";
                                label2.Text = "Şarkı Sayısı: 0";
                                richTextBox1.Text = "Kayıt bulunamadı.";
                                DisposePictureBoxImage(pictureBox1);

                                flpSongs.Controls.Clear();
                                flpSongs.Controls.Add(BuildInfoLabel("Kayıt bulunamadı."));
                                return;
                            }

                            adSoyad = r["AdSoyad"] == DBNull.Value ? "Bilinmiyor" : r["AdSoyad"].ToString();
                            photo = r["userPhoto"] == DBNull.Value ? "" : r["userPhoto"].ToString();

                            // ✅ FIX: sanatciId (sanatcilar tablosundaki ID)
                            sanatciId = (r["SanatciID"] == DBNull.Value) ? 0 : Convert.ToInt32(r["SanatciID"]);

                            sarkiSayisiObj = r["SarkiSayisi"];
                            bio = r["Biyografi"] == DBNull.Value ? "" : r["Biyografi"].ToString();
                        }
                    }

                    label1.Text = adSoyad;
                    richTextBox1.Text = string.IsNullOrWhiteSpace(bio) ? "Biyografi yok." : bio;

                    // ✅ Foto güvenli yükle
                    LoadImageSafe(pictureBox1, photo);

                    // ✅ Eğer bu kullanıcı sanatçı değilse (sanatcilar kaydı yok)
                    if (sanatciId <= 0)
                    {
                        label2.Text = "Şarkı Sayısı: 0";
                        flpSongs.Controls.Clear();
                        flpSongs.Controls.Add(BuildInfoLabel("Bu kullanıcı için sanatçı kaydı yok (sanatcilar tablosunda kayıt bulunamadı)."));
                        return;
                    }

                    int sarkiSayisi = 0;

                    // ✅ SarkiSayisi kolonun varsa onu kullan
                    if (sarkiSayisiObj != null && sarkiSayisiObj != DBNull.Value)
                    {
                        int.TryParse(sarkiSayisiObj.ToString(), out sarkiSayisi);
                    }
                    else
                    {
                        // ✅ FIX: Count artık sanatciId ile
                        using (var cmdCount = new MySqlCommand("SELECT COUNT(*) FROM muzikler WHERE SanatciID=@id", conn))
                        {
                            cmdCount.Parameters.AddWithValue("@id", sanatciId);
                            var cnt = cmdCount.ExecuteScalar();
                            if (cnt != null && cnt != DBNull.Value)
                                sarkiSayisi = Convert.ToInt32(cnt);
                        }
                    }

                    label2.Text = $"Şarkı Sayısı: {sarkiSayisi}";

                    // ✅ FIX: şarkıları sanatciId ile çek
                    LoadAllSongs(conn, sanatciId);
                }
            }
            catch (Exception ex)
            {
                label1.Text = "Hata";
                label2.Text = "Şarkı Sayısı: ?";
                richTextBox1.Text = "Sanatçı sayfası yüklenemedi:\n" + ex.Message;

                flpSongs.Controls.Clear();
                flpSongs.Controls.Add(BuildErrorLabel("Şarkılar yüklenemedi:\n" + ex.Message));
            }
        }

        // ✅ Parametre artık sanatciId (sanatcilar.SanatciID)
        private void LoadAllSongs(MySqlConnection conn, int sanatciId)
        {
            EnsureSongsContainer();

            // ✅ Önce eski row resimlerini dispose et (GDI leak fix)
            DisposeAllSongRowImages();
            flpSongs.Controls.Clear();

            const string sql = @"
SELECT MuzikID, SarkiAdi, SanatciAdi, pictures
FROM muzikler
WHERE SanatciID = @id
ORDER BY Tarih DESC;";

            using (var cmd = new MySqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@id", sanatciId);

                using (var r = cmd.ExecuteReader())
                {
                    if (!r.HasRows)
                    {
                        flpSongs.Controls.Add(BuildInfoLabel("Bu sanatçıya ait şarkı bulunamadı."));
                        return;
                    }

                    while (r.Read())
                    {
                        int muzikId = r["MuzikID"] == DBNull.Value ? 0 : Convert.ToInt32(r["MuzikID"]);
                        string sarkiAdi = r["SarkiAdi"] == DBNull.Value ? "Bilinmiyor" : r["SarkiAdi"].ToString();
                        string sanatciAdi = r["SanatciAdi"] == DBNull.Value ? "Bilinmiyor" : r["SanatciAdi"].ToString();
                        string cover = r["pictures"] == DBNull.Value ? "" : r["pictures"].ToString();

                        flpSongs.Controls.Add(CreateSongRow(muzikId, sarkiAdi, sanatciAdi, cover));
                    }
                }
            }
        }

        private Control CreateSongRow(int muzikId, string sarkiAdi, string sanatciAdi, string coverPath)
        {
            var row = new Panel
            {
                Height = 72,
                Width = Math.Max(100, flpSongs.ClientSize.Width - 25),
                BackColor = Color.FromArgb(30, 30, 30),
                Margin = new Padding(0, 0, 0, 10),
                Cursor = Cursors.Hand,
                Tag = muzikId
            };

            var pic = new PictureBox
            {
                Width = 52,
                Height = 52,
                Location = new Point(10, 10),
                SizeMode = PictureBoxSizeMode.StretchImage,
                BackColor = Color.FromArgb(20, 20, 20)
            };

            // ✅ Kapak güvenli yükle
            LoadImageSafe(pic, coverPath);

            var lblSong = new Label
            {
                Text = sarkiAdi,
                ForeColor = Color.White,
                Font = new Font("Elephant", 10F, FontStyle.Regular),
                AutoSize = false,
                Width = Math.Max(10, row.Width - 90),
                Height = 26,
                Location = new Point(75, 14)
            };

            var lblArtist = new Label
            {
                Text = sanatciAdi,
                ForeColor = Color.Gray,
                Font = new Font("Elephant", 8.5F, FontStyle.Regular),
                AutoSize = false,
                Width = Math.Max(10, row.Width - 90),
                Height = 22,
                Location = new Point(75, 38)
            };

            void hoverOn(object s, EventArgs e) => row.BackColor = Color.FromArgb(45, 45, 45);
            void hoverOff(object s, EventArgs e) => row.BackColor = Color.FromArgb(30, 30, 30);

            row.MouseEnter += hoverOn; row.MouseLeave += hoverOff;
            pic.MouseEnter += hoverOn; pic.MouseLeave += hoverOff;
            lblSong.MouseEnter += hoverOn; lblSong.MouseLeave += hoverOff;
            lblArtist.MouseEnter += hoverOn; lblArtist.MouseLeave += hoverOff;

            void selectSong(object s, EventArgs e)
            {
                if (muzikId <= 0) return;

                if (this.Owner is Form1 f)
                    f.PlaySingleSong(muzikId);

                this.Close();
            }


            row.Click += selectSong;
            pic.Click += selectSong;
            lblSong.Click += selectSong;
            lblArtist.Click += selectSong;

            row.Controls.Add(pic);
            row.Controls.Add(lblSong);
            row.Controls.Add(lblArtist);

            return row;
        }

        private Label BuildInfoLabel(string text)
        {
            return new Label
            {
                Text = text,
                ForeColor = Color.Gray,
                Font = new Font("Elephant", 9F, FontStyle.Regular),
                AutoSize = true,
                Padding = new Padding(6)
            };
        }

        private Label BuildErrorLabel(string text)
        {
            return new Label
            {
                Text = text,
                ForeColor = Color.IndianRed,
                Font = new Font("Elephant", 9F, FontStyle.Regular),
                AutoSize = true,
                Padding = new Padding(6)
            };
        }

        // ===========================
        // PATH ÇÖZÜMLEYİCİ
        // ===========================
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

        private void LoadImageSafe(PictureBox pb, string relativeOrFullPath)
        {
            try
            {
                if (pb == null) return;

                if (string.IsNullOrWhiteSpace(relativeOrFullPath))
                {
                    DisposePictureBoxImage(pb);
                    pb.ImageLocation = null;
                    return;
                }

                string full = ResolveAnyPath(relativeOrFullPath);

                if (!string.IsNullOrWhiteSpace(full) && File.Exists(full))
                {
                    using (var bmpTemp = new Bitmap(full))
                    {
                        DisposePictureBoxImage(pb);
                        pb.Image = new Bitmap(bmpTemp);
                    }
                    pb.SizeMode = PictureBoxSizeMode.StretchImage;
                }
                else
                {
                    DisposePictureBoxImage(pb);
                    pb.ImageLocation = null;
                }
            }
            catch
            {
                try
                {
                    DisposePictureBoxImage(pb);
                    pb.ImageLocation = null;
                }
                catch { }
            }
        }

        // ===========================
        // ROUND
        // ===========================
        private void ApplyRoundedToAll()
        {
            if (!IsHandleCreated) return;

            var excluded = new HashSet<Control>();
            if (_topHeaderPanel != null)
            {
                excluded.Add(_topHeaderPanel);
                AddAllChildrenToSet(_topHeaderPanel, excluded);
            }

            ApplyRoundedRecursive(this, excluded);
        }

        private void ApplyRoundedRecursive(Control parent, HashSet<Control> excluded)
        {
            foreach (Control c in parent.Controls)
            {
                if (excluded != null && excluded.Contains(c))
                    continue;

                if (c is Panel)
                {
                    SetRoundedRegion(c, PanelRadius);
                    HookSizeChanged(c);
                }
                else if (c is PictureBox)
                {
                    SetRoundedRegion(c, PictureRadius);
                    HookSizeChanged(c);
                }
                else if (c is RichTextBox rtb)
                {
                    rtb.BorderStyle = BorderStyle.None;
                    SetRoundedRegion(rtb, RichTextRadius);
                    HookSizeChanged(rtb);
                }

                if (c.HasChildren)
                    ApplyRoundedRecursive(c, excluded);
            }
        }

        private void HookSizeChanged(Control c)
        {
            c.SizeChanged -= Control_SizeChanged_Reapply;
            c.SizeChanged += Control_SizeChanged_Reapply;
        }

        private void Control_SizeChanged_Reapply(object sender, EventArgs e)
        {
            if (sender is not Control ctrl) return;

            if (_topHeaderPanel != null && (ctrl == _topHeaderPanel || IsDescendantOf(ctrl, _topHeaderPanel)))
                return;

            int radius = ctrl switch
            {
                Panel => PanelRadius,
                PictureBox => PictureRadius,
                RichTextBox => RichTextRadius,
                _ => 0
            };

            if (radius > 0)
                SetRoundedRegion(ctrl, radius);
        }

        private void AddAllChildrenToSet(Control parent, HashSet<Control> set)
        {
            foreach (Control c in parent.Controls)
            {
                set.Add(c);
                if (c.HasChildren)
                    AddAllChildrenToSet(c, set);
            }
        }

        private bool IsDescendantOf(Control child, Control ancestor)
        {
            Control cur = child.Parent;
            while (cur != null)
            {
                if (cur == ancestor) return true;
                cur = cur.Parent;
            }
            return false;
        }

        private void SetRoundedRegion(Control control, int radius)
        {
            if (control == null) return;
            if (control.Width <= 0 || control.Height <= 0) return;

            int r = Math.Min(radius, Math.Min(control.Width, control.Height) / 2);

            using (GraphicsPath path = GetRoundedRectPath(new Rectangle(0, 0, control.Width, control.Height), r))
            {
                control.Region?.Dispose();
                control.Region = new Region(path);
            }
        }

        private GraphicsPath GetRoundedRectPath(Rectangle rect, int radius)
        {
            GraphicsPath path = new GraphicsPath();
            int d = radius * 2;

            if (radius <= 0)
            {
                path.AddRectangle(rect);
                path.CloseFigure();
                return path;
            }

            Rectangle arc = new Rectangle(rect.X, rect.Y, d, d);
            path.AddArc(arc, 180, 90);
            arc.X = rect.Right - d;
            path.AddArc(arc, 270, 90);
            arc.Y = rect.Bottom - d;
            path.AddArc(arc, 0, 90);
            arc.X = rect.Left;
            path.AddArc(arc, 90, 90);

            path.CloseFigure();
            return path;
        }

        // ===========================
        // NAVIGATION
        // ===========================
        private void pictureBox4_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.Owner != null)
                {
                    this.Owner.Show();
                    this.Owner.WindowState = FormWindowState.Normal;
                    this.Owner.Activate();
                }
            }
            catch { }

            this.Close();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            using (var se = new DefaultAyarlar())
            {
                se.Owner = this.Owner; // ✅ Owner zinciri korunsun
                this.Hide();
                se.ShowDialog(this.Owner ?? this);
                this.Show();
                this.Activate();
            }
            this.Close();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            using (var se = new AboutUs())
            {
                se.Owner = this.Owner; // ✅ Owner zinciri korunsun
                this.Hide();
                se.ShowDialog(this.Owner ?? this);
                this.Show();
                this.Activate();
            }
            this.Close();
        }

        // Designer’da kalmış boş eventler varsa sorun çıkarmasın:
        private void label2_Click(object sender, EventArgs e) { }
        private void label3_Click(object sender, EventArgs e) { }

        // pictureBox4_Click_1 gibi eventlerin varsa designer’dan kaldır
        private void pictureBox4_Click_1(object sender, EventArgs e) { }
        private void pictureBox4_Click_2(object sender, EventArgs e) { }
    }
}
