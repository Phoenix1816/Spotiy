#nullable disable
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace SpotiyV2._0
{
    public partial class DefaultAyarlar : Form
    {
        // 0 = Default, 1 = Admin, 2 = Sanatçı
        public static int Rol { get; set; } = 0;

        private readonly string baglantiKodu =
            "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        // Orijinal değerler (İptal için)
        private string _origKullaniciAdi = "";
        private string _origEmail = "";
        private string _origSifre = "";
        private string _origPhoto = "";

        // ✅ Seçilen yeni foto (DB’ye yazılacak yol)
        private string _newPhotoDbPath = "";   // örn: /pictures/abc.jpg

        public DefaultAyarlar()
        {
            InitializeComponent();

            // ✅ Event’leri garantiye al (Designer koparabiliyor / çakışabiliyor)
            this.Load -= DefaultAyarlar_Load;
            this.Load += DefaultAyarlar_Load;

            button1.Click -= button1_Click_1;
            button1.Click += button1_Click_1;

            button2.Click -= button2_Click;
            button2.Click += button2_Click;

            pictureBox2.Click -= pictureBox2_Click;
            pictureBox2.Click += pictureBox2_Click;

            pictureBox19.Click -= pictureBox19_Click;
            pictureBox19.Click += pictureBox19_Click;

            pictureBox27.Click -= pictureBox27_Click;
            pictureBox27.Click += pictureBox27_Click;

            btnAdminPanel.Click -= btnAdminPanel_Click;
            btnAdminPanel.Click += btnAdminPanel_Click;

            btnSarkiEkle.Click -= btnSarkiEkle_Click;
            btnSarkiEkle.Click += btnSarkiEkle_Click;

            // Rounded: resize’da güncelle
            panel1.Resize -= Panel1_Resize;
            panel1.Resize += Panel1_Resize;
        }

        private void DefaultAyarlar_Load(object sender, EventArgs e)
        {
            panel1.BackColor = Color.FromArgb(26, 26, 26);

            StilPrimarySari(button1);      // Kaydet
            StilSecondaryGri(button2);     // İptal
            StilPrimarySari(btnAdminPanel);
            StilPrimarySari(btnSarkiEkle);

            ApplyRoundedAll();

            btnAdminPanel.Visible = (Rol == 1);
            btnSarkiEkle.Visible = (Rol == 2);

            // ✅ pictureBox2 tıklanınca resim seç
            pictureBox2.Cursor = Cursors.Hand;

            LoadUserSettingsToUI();
        }

        private void Panel1_Resize(object sender, EventArgs e)
        {
            MakeRounded(panel1, 20);
        }

        private void ApplyRoundedAll()
        {
            MakeRounded(panel1, 20);
            MakeRounded(button1, 12);
            MakeRounded(button2, 12);
            MakeRounded(btnAdminPanel, 12);
            MakeRounded(btnSarkiEkle, 12);
        }

        // =========================
        // DB → UI
        // =========================
        private void LoadUserSettingsToUI()
        {
            int userId = Form1.CurrentKullaniciID;
            if (userId <= 0) return;

            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();

                    using (var cmd = new MySqlCommand(@"
SELECT AdSoyad, Email, Sifre, IFNULL(userPhoto,'') userPhoto
FROM kullanicilar
WHERE KullaniciID=@id
LIMIT 1;", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", userId);

                        using (var rd = cmd.ExecuteReader(CommandBehavior.SingleRow))
                        {
                            if (!rd.Read()) return;

                            _origKullaniciAdi = rd["AdSoyad"]?.ToString() ?? "";
                            _origEmail = rd["Email"]?.ToString() ?? "";
                            _origSifre = rd["Sifre"]?.ToString() ?? "";
                            _origPhoto = rd["userPhoto"]?.ToString() ?? "";

                            _newPhotoDbPath = "";

                            textBox2.Text = _origKullaniciAdi;
                            textBox3.Text = _origEmail;
                            textBox4.Text = _origSifre;

                            LoadPhotoToPictureBox(_origPhoto);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ayarlar yüklenemedi: " + ex.Message);
            }
        }

        // =========================
        // ✅ pictureBox2 → Resim seç
        // =========================
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            using (var ofd = new OpenFileDialog())
            {
                ofd.Title = "Profil fotoğrafı seç";
                ofd.Filter = "Resim Dosyaları|*.jpg;*.jpeg;*.png;*.bmp;*.gif|Tüm Dosyalar|*.*";
                ofd.Multiselect = false;

                if (ofd.ShowDialog() != DialogResult.OK) return;

                try
                {
                    string projectRoot = GetProjectRootFallback();
                    string picturesDir = Path.Combine(projectRoot, "pictures");
                    if (!Directory.Exists(picturesDir))
                        Directory.CreateDirectory(picturesDir);

                    string ext = Path.GetExtension(ofd.FileName);
                    string fileName = $"user_{Form1.CurrentKullaniciID}_{DateTime.Now:yyyyMMdd_HHmmss}{ext}";
                    string destFullPath = Path.Combine(picturesDir, fileName);

                    File.Copy(ofd.FileName, destFullPath, true);

                    _newPhotoDbPath = "/pictures/" + fileName;

                    SetPictureBoxImageNoLock(pictureBox1, destFullPath);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Resim seçilemedi: " + ex.Message);
                }
            }
        }

        private void LoadPhotoToPictureBox(string dbPath)
        {
            try
            {
                string path = string.IsNullOrWhiteSpace(dbPath)
                    ? "/pictures/default.jpg"
                    : dbPath;

                string fullPath = ResolvePathFromDbStyle(path);
                if (string.IsNullOrWhiteSpace(fullPath) || !File.Exists(fullPath))
                {
                    pictureBox1.Image = null;
                    return;
                }

                SetPictureBoxImageNoLock(pictureBox1, fullPath);
            }
            catch { }
        }

        private string ResolvePathFromDbStyle(string dbStylePath)
        {
            if (string.IsNullOrWhiteSpace(dbStylePath)) return "";

            string normalized = dbStylePath.Replace("/", "\\").TrimStart('\\');

            string exeDir = Application.StartupPath;
            string try1 = Path.Combine(exeDir, normalized);
            if (File.Exists(try1)) return try1;

            string baseDir = AppDomain.CurrentDomain.BaseDirectory;
            string try2 = Path.Combine(baseDir, normalized);
            if (File.Exists(try2)) return try2;

            string root = GetProjectRootFallback();
            string try3 = Path.Combine(root, normalized);
            if (File.Exists(try3)) return try3;

            return "";
        }

        private string GetProjectRootFallback()
        {
            try
            {
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;

                string p3 = Directory.GetParent(baseDir)?.Parent?.Parent?.FullName;
                if (!string.IsNullOrWhiteSpace(p3) && Directory.Exists(p3))
                    return p3;

                string p2 = Directory.GetParent(baseDir)?.Parent?.FullName;
                if (!string.IsNullOrWhiteSpace(p2) && Directory.Exists(p2))
                    return p2;

                return baseDir;
            }
            catch
            {
                return AppDomain.CurrentDomain.BaseDirectory;
            }
        }

        private void SetPictureBoxImageNoLock(PictureBox pb, string filePath)
        {
            if (pb == null) return;
            if (string.IsNullOrWhiteSpace(filePath) || !File.Exists(filePath)) return;

            try
            {
                var old = pb.Image;
                pb.Image = null;
                old?.Dispose();
            }
            catch { }

            using (var fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            using (var img = Image.FromStream(fs))
            {
                pb.Image = new Bitmap(img);
                pb.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        // =========================
        // Kaydet
        // =========================
        private void button1_Click_1(object sender, EventArgs e)
        {
            int userId = Form1.CurrentKullaniciID;
            if (userId <= 0) return;

            string kullaniciAdi = textBox2.Text.Trim();
            string email = textBox3.Text.Trim();
            string sifre = textBox4.Text;

            if (string.IsNullOrWhiteSpace(kullaniciAdi) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(sifre))
            {
                MessageBox.Show("Alanlar boş olamaz.");
                return;
            }

            string photoToSave = string.IsNullOrWhiteSpace(_newPhotoDbPath) ? _origPhoto : _newPhotoDbPath;

            try
            {
                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();

                    using (var check = new MySqlCommand(@"
SELECT COUNT(*)
FROM kullanicilar
WHERE Email=@mail AND KullaniciID<>@id;", conn))
                    {
                        check.Parameters.AddWithValue("@mail", email);
                        check.Parameters.AddWithValue("@id", userId);

                        if ((long)check.ExecuteScalar() > 0)
                        {
                            MessageBox.Show("Bu e-mail başka bir kullanıcıda kayıtlı.");
                            return;
                        }
                    }

                    using (var cmd = new MySqlCommand(@"
UPDATE kullanicilar
SET AdSoyad=@ad,
    Email=@mail,
    Sifre=@sifre,
    userPhoto=@photo
WHERE KullaniciID=@id;", conn))
                    {
                        cmd.Parameters.AddWithValue("@ad", kullaniciAdi);
                        cmd.Parameters.AddWithValue("@mail", email);
                        cmd.Parameters.AddWithValue("@sifre", sifre);
                        cmd.Parameters.AddWithValue("@photo", photoToSave);
                        cmd.Parameters.AddWithValue("@id", userId);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            _origKullaniciAdi = kullaniciAdi;
                            _origEmail = email;
                            _origSifre = sifre;

                            _origPhoto = photoToSave;
                            _newPhotoDbPath = "";

                            MessageBox.Show("Ayarlar kaydedildi ✅");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Kaydetme hatası: " + ex.Message);
            }
        }

        // =========================
        // İptal
        // =========================
        private void button2_Click(object sender, EventArgs e)
        {
            textBox2.Text = _origKullaniciAdi;
            textBox3.Text = _origEmail;
            textBox4.Text = _origSifre;

            _newPhotoDbPath = "";

            LoadPhotoToPictureBox(_origPhoto);
        }

        // =========================
        // Stil & Rounded
        // =========================
        private void MakeRounded(Control c, int r)
        {
            if (c == null) return;
            if (c.Width <= 0 || c.Height <= 0) return;

            int d = r * 2;
            if (d > c.Width) d = c.Width;
            if (d > c.Height) d = c.Height;

            using (GraphicsPath p = new GraphicsPath())
            {
                p.AddArc(0, 0, d, d, 180, 90);
                p.AddArc(c.Width - d, 0, d, d, 270, 90);
                p.AddArc(c.Width - d, c.Height - d, d, d, 0, 90);
                p.AddArc(0, c.Height - d, d, d, 90, 90);
                p.CloseFigure();

                var old = c.Region;
                c.Region = new Region(p);
                old?.Dispose();
            }
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

        // =========================
        // Navigation
        // =========================
        private void pictureBox19_Click(object sender, EventArgs e)
        {
            if (this.Owner != null)
            {
                ShowAndFocusForm(this.Owner);
                this.Close();
                return;
            }

            var form1 = Application.OpenForms.Cast<Form>().FirstOrDefault(f => f is Form1);
            if (form1 != null)
            {
                ShowAndFocusForm(form1);
                this.Close();
                return;
            }

            this.Close();
        }

        private void pictureBox27_Click(object sender, EventArgs e)
        {
            try
            {
                using (var about = new AboutUs())
                {
                    this.Hide();

                    // ✅ Owner döngüsü olmasın: ShowDialog(this) yeterli
                    about.ShowDialog(this);
                }
            }
            finally
            {
                this.Show();
                this.WindowState = FormWindowState.Normal;
                this.Activate();
                this.BringToFront();
            }
        }

        private void btnAdminPanel_Click(object sender, EventArgs e)
        {
            try
            {
                using (var admin = new AdminPaneli())
                {
                    this.Hide();

                    // ✅ Owner döngüsü olmasın: ShowDialog(this) yeterli
                    admin.ShowDialog(this);
                }
            }
            finally
            {
                this.Show();
                this.WindowState = FormWindowState.Normal;
                this.Activate();
                this.BringToFront();
            }
        }

        private void btnSarkiEkle_Click(object sender, EventArgs e)
        {
            try
            {
                using (var se = new SarkıEkle())
                {
                    this.Hide();

                    // ✅ HATANIN NET ÇÖZÜMÜ:
                    // ❌ se.Owner = this.Owner (YOK)
                    // ✅ se.ShowDialog(this) (VAR)
                    se.ShowDialog(this);
                }
            }
            finally
            {
                this.Show();
                this.WindowState = FormWindowState.Normal;
                this.Activate();
                this.BringToFront();
                this.Invalidate(true);
                this.Update();
                this.Refresh();
            }
        }

        private static void ShowAndFocusForm(Form f)
        {
            try
            {
                if (f == null || f.IsDisposed) return;

                f.Show();
                f.WindowState = FormWindowState.Normal;
                f.Activate();
                f.BringToFront();
                f.Focus();
            }
            catch { }
        }
    }
}
