#nullable disable
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace SpotiyV2._0
{
    public partial class SarkıEkle : Form
    {
        private string _seciliDosyaYolu;

        // ✅ Kapak foto
        private string _seciliKapakDosyaYolu;           // kullanıcının seçtiği dosyanın gerçek yolu
        private const string DefaultCoverToken = "/pictures/default.jpg";

        // DB
        private readonly string baglantiKodu =
            "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        public SarkıEkle()
        {
            InitializeComponent();
            BindEventsSafely();
        }

        private void BindEventsSafely()
        {
            this.Load -= SarkıEkle_Load;
            this.Load += SarkıEkle_Load;

            // Kapak ikon
            pictureBox2.Click -= pictureBox2_Click;
            pictureBox2.Click += pictureBox2_Click;

            // Şarkı seç / yükle / iptal
            button1.Click -= button1_Click;
            button1.Click += button1_Click;

            button2.Click -= button2_Click;
            button2.Click += button2_Click;

            button3.Click -= button3_Click;
            button3.Click += button3_Click;

            // Üst bar
            pictureBox19.Click -= pictureBox19_Click;
            pictureBox19.Click += pictureBox19_Click;

            pictureBox16.Click -= pictureBox16_Click;
            pictureBox16.Click += pictureBox16_Click;

            pictureBox27.Click -= pictureBox27_Click;
            pictureBox27.Click += pictureBox27_Click;

            // Form kapanırken resimleri dispose et
            this.FormClosed -= SarkıEkle_FormClosed;
            this.FormClosed += SarkıEkle_FormClosed;
        }

        private void SarkıEkle_Load(object sender, EventArgs e)
        {
            panel1.BackColor = Color.FromArgb(26, 26, 26);

            StilPrimarySari(button2);   // Yükle
            StilSecondaryGri(button3);  // Kapat
            StilSecondaryGri(button1);  // Şarkı seç

            MakeRounded(panel1, 20);
            MakeRounded(button1, 12);
            MakeRounded(button2, 12);
            MakeRounded(button3, 12);

            panel1.Resize += (s, ev) => MakeRounded(panel1, 20);

            button1.UseVisualStyleBackColor = false;
            button2.UseVisualStyleBackColor = false;
            button3.UseVisualStyleBackColor = false;

            // ✅ Kapak seçim ikonuna “tıklanabilir” hissi
            pictureBox2.Cursor = Cursors.Hand;

            // Kapak alanı
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void SarkıEkle_FormClosed(object sender, FormClosedEventArgs e)
        {
            DisposePictureBoxImage(pictureBox1);
        }

        // ---------------- UI ----------------

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

        private void MakeRounded(Control c, int r)
        {
            if (c.Width <= 0 || c.Height <= 0) return;

            int d = r * 2;
            using GraphicsPath p = new GraphicsPath();
            p.AddArc(0, 0, d, d, 180, 90);
            p.AddArc(c.Width - d, 0, d, d, 270, 90);
            p.AddArc(c.Width - d, c.Height - d, d, d, 0, 90);
            p.AddArc(0, c.Height - d, d, d, 90, 90);
            p.CloseFigure();
            c.Region?.Dispose();
            c.Region = new Region(p);
        }

        private void StilPrimarySari(Button b)
        {
            b.BackColor = Color.FromArgb(255, 200, 0);
            b.ForeColor = Color.Black;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
        }

        private void StilSecondaryGri(Button b)
        {
            b.BackColor = Color.FromArgb(60, 60, 60);
            b.ForeColor = Color.White;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
        }

        // ---------------- KAPAK SEÇ (pictureBox2) ----------------
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            using OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Kapak Fotoğrafı Seç";
            ofd.Filter = "Image Files (*.jpg;*.jpeg;*.png;*.bmp;*.gif;*.webp)|*.jpg;*.jpeg;*.png;*.bmp;*.gif;*.webp|All Files (*.*)|*.*";

            if (ofd.ShowDialog() != DialogResult.OK)
                return;

            _seciliKapakDosyaYolu = ofd.FileName;

            // Önizleme (dosya kilidi olmasın diye clone)
            try
            {
                using var bmpTemp = new Bitmap(_seciliKapakDosyaYolu);
                DisposePictureBoxImage(pictureBox1);
                pictureBox1.Image = new Bitmap(bmpTemp);
            }
            catch
            {
                MessageBox.Show("Kapak görseli yüklenemedi.");
                _seciliKapakDosyaYolu = null;
                DisposePictureBoxImage(pictureBox1);
                return;
            }

            MessageBox.Show("✅ Kapak seçildi.");
        }

        // ---------------- ŞARKI SEÇ ----------------
        private void button1_Click(object sender, EventArgs e)
        {
            using OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Şarkı Dosyası Seç";
            ofd.Filter = "MP3 (*.mp3)|*.mp3|WAV (*.wav)|*.wav|All Files (*.*)|*.*";

            if (ofd.ShowDialog() == DialogResult.OK)
            {
                _seciliDosyaYolu = ofd.FileName;

                if (string.IsNullOrWhiteSpace(textBox2.Text))
                    textBox2.Text = Path.GetFileNameWithoutExtension(ofd.FileName);
            }
        }

        // ---------------- YÜKLE ----------------
        private void button2_Click(object sender, EventArgs e)
        {
            string sarkiAdiInput = (textBox2.Text ?? "").Trim();

            if (string.IsNullOrWhiteSpace(sarkiAdiInput))
            {
                MessageBox.Show("Şarkı adı boş olamaz.");
                return;
            }

            if (string.IsNullOrWhiteSpace(_seciliDosyaYolu) || !File.Exists(_seciliDosyaYolu))
            {
                MessageBox.Show("Şarkı dosyası seçilmedi.");
                return;
            }

            int kullaniciId = Form1.CurrentKullaniciID;
            if (kullaniciId <= 0)
            {
                MessageBox.Show("Giriş yapan kullanıcı bulunamadı.");
                return;
            }

            try
            {
                // ✅ Proje kökü / exe yolu çözümü (Form1 mantığına benzer)
                string projectRoot = TryGetProjectRoot();
                string exeDir = Application.StartupPath;

                // Hedef klasörler: mümkünse proje kökü (debug taşıma kolay)
                string baseOut = !string.IsNullOrWhiteSpace(projectRoot) ? projectRoot : exeDir;

                string musicDir = Path.Combine(baseOut, "music");
                string picturesDir = Path.Combine(baseOut, "pictures");

                Directory.CreateDirectory(musicDir);
                Directory.CreateDirectory(picturesDir);

                using var conn = new MySqlConnection(baglantiKodu);
                conn.Open();

                using var tx = conn.BeginTransaction();

                int sanatciId = GetSanatciId(conn, tx, kullaniciId);

                // Sanatçı adı: önce kullanicilar.AdSoyad'dan çek (daha sağlam)
                string sanatciAdi = GetSanatciAdi(conn, tx, kullaniciId, sanatciId);

                // 1) Şarkıyı kopyala
                string musicExt = Path.GetExtension(_seciliDosyaYolu);
                if (string.IsNullOrWhiteSpace(musicExt)) musicExt = ".mp3";

                string musicFileName = Slug($"{sanatciAdi}_{sarkiAdiInput}") + musicExt;
                string musicTargetFull = Path.Combine(musicDir, musicFileName);

                File.Copy(_seciliDosyaYolu, musicTargetFull, true);

                string urlToken = "/music/" + musicFileName;

                // 2) Kapak kopyala (varsa)
                string picToken = DefaultCoverToken;

                if (!string.IsNullOrWhiteSpace(_seciliKapakDosyaYolu) && File.Exists(_seciliKapakDosyaYolu))
                {
                    string picExt = Path.GetExtension(_seciliKapakDosyaYolu);
                    if (string.IsNullOrWhiteSpace(picExt)) picExt = ".jpg";

                    string picName = Slug($"{sanatciAdi}_{sarkiAdiInput}_cover") + picExt;
                    string picTargetFull = Path.Combine(picturesDir, picName);

                    File.Copy(_seciliKapakDosyaYolu, picTargetFull, true);
                    picToken = "/pictures/" + picName;
                }

                // 3) DB Insert
                InsertMuzik(conn, tx, sanatciId, sanatciAdi, sarkiAdiInput, urlToken, picToken);

                // 4) SarkiSayisi +1
                IncreaseSarkiSayisi(conn, tx, sanatciId);

                tx.Commit();

                MessageBox.Show("✅ Şarkı başarıyla eklendi.");

                // Reset
                textBox2.Clear();
                _seciliDosyaYolu = null;
                _seciliKapakDosyaYolu = null;
                DisposePictureBoxImage(pictureBox1);
            }
            catch (Exception ex)
            {
                MessageBox.Show("HATA:\n" + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e) => Close();

        // ---------------- DB (Transaction uyumlu) ----------------

        private int GetSanatciId(MySqlConnection c, MySqlTransaction tx, int kullaniciId)
        {
            using var cmd = new MySqlCommand(
                "SELECT SanatciID FROM sanatcilar WHERE KullaniciID=@k LIMIT 1", c, tx);
            cmd.Parameters.AddWithValue("@k", kullaniciId);

            var r = cmd.ExecuteScalar();
            if (r == null || r == DBNull.Value)
                throw new Exception("Bu kullanıcıya ait sanatçı kaydı yok.");

            return Convert.ToInt32(r);
        }

        // ✅ En sağlam sanatçı adı: kullanicilar.AdSoyad
        private string GetSanatciAdi(MySqlConnection c, MySqlTransaction tx, int kullaniciId, int sanatciId)
        {
            using (var cmd = new MySqlCommand(
                "SELECT AdSoyad FROM kullanicilar WHERE KullaniciID=@id LIMIT 1", c, tx))
            {
                cmd.Parameters.AddWithValue("@id", kullaniciId);
                var r = cmd.ExecuteScalar();
                string ad = (r == null || r == DBNull.Value) ? "" : r.ToString();
                if (!string.IsNullOrWhiteSpace(ad)) return ad;
            }

            // fallback: muzikler’den çek
            using (var cmd2 = new MySqlCommand(
                "SELECT SanatciAdi FROM muzikler WHERE SanatciID=@id LIMIT 1", c, tx))
            {
                cmd2.Parameters.AddWithValue("@id", sanatciId);
                var r2 = cmd2.ExecuteScalar();
                string ad2 = (r2 == null || r2 == DBNull.Value) ? "" : r2.ToString();
                return string.IsNullOrWhiteSpace(ad2) ? $"Artist_{sanatciId}" : ad2;
            }
        }

        private void InsertMuzik(
            MySqlConnection c,
            MySqlTransaction tx,
            int sanatciId,
            string sanatciAdi,
            string sarkiAdi,
            string url,
            string pic)
        {
            const string sql = @"
INSERT INTO muzikler
(SanatciID, SanatciAdi, SarkiAdi, SarkiSozleri, Uzunluk, Tarih, UrlToken, pictures)
VALUES
(@sid, @adi, @sarki, @soz, @uz, @tarih, @url, @pic);";

            using var cmd = new MySqlCommand(sql, c, tx);
            cmd.Parameters.AddWithValue("@sid", sanatciId);
            cmd.Parameters.AddWithValue("@adi", sanatciAdi);
            cmd.Parameters.AddWithValue("@sarki", sarkiAdi);

            // NOT NULL kolonlar için güvenli default
            cmd.Parameters.AddWithValue("@soz", "");
            cmd.Parameters.AddWithValue("@uz", "");
            cmd.Parameters.AddWithValue("@tarih", DateTime.Now);

            cmd.Parameters.AddWithValue("@url", url);
            cmd.Parameters.AddWithValue("@pic", pic);

            cmd.ExecuteNonQuery();
        }

        private void IncreaseSarkiSayisi(MySqlConnection c, MySqlTransaction tx, int sanatciId)
        {
            using var cmd = new MySqlCommand(
                "UPDATE sanatcilar SET SarkiSayisi = COALESCE(SarkiSayisi,0) + 1 WHERE SanatciID=@id", c, tx);
            cmd.Parameters.AddWithValue("@id", sanatciId);
            cmd.ExecuteNonQuery();
        }

        // ---------------- Path Helpers ----------------

        private string TryGetProjectRoot()
        {
            try
            {
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;
                // bin\Debug\netX -> ..\..\.. (proje kökü)
                string root = Directory.GetParent(baseDir)?.Parent?.Parent?.FullName;
                return string.IsNullOrWhiteSpace(root) ? "" : root;
            }
            catch { return ""; }
        }

        private string Slug(string s)
        {
            s = (s ?? "").ToLowerInvariant()
                 .Replace(" ", "_")
                 .Replace("ğ", "g").Replace("ü", "u").Replace("ş", "s")
                 .Replace("ı", "i").Replace("ö", "o").Replace("ç", "c");

            foreach (char c in Path.GetInvalidFileNameChars())
                s = s.Replace(c.ToString(), "");

            // Çok uzunsa kırp (Windows path limitlerine takılma)
            if (s.Length > 120) s = s.Substring(0, 120);

            return s;
        }

        // ---------------- ÜST BAR EVENTLERİ ----------------

        private void pictureBox19_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK; // opsiyonel
            this.Close();
        }

            

        private void pictureBox16_Click(object sender, EventArgs e)
        {
            // ✅ direkt bağlayalım (hazır proje yapın böyle)
            using (var da = new DefaultAyarlar())
            {
                da.Owner = this.Owner;
                this.Hide();
                da.ShowDialog(this.Owner ?? this);
                this.Show();
                this.Activate();
            }
        }

        private void pictureBox27_Click(object sender, EventArgs e)
        {
            using (var about = new AboutUs())
            {
                about.Owner = this.Owner;
                this.Hide();
                about.ShowDialog(this.Owner ?? this);
                this.Show();
                this.Activate();
            }
        }
    }
}
