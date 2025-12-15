using MySql.Data.MySqlClient;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace LoginSginupResetPassword
{
    public partial class SignUp : Form
    {
        // ✅ DB: muzikapp
        private readonly string connStr = "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        // ✅ Şifre görünürlük durumları
        private bool _pwVisible1 = false; // textBox3 (Password)
        private bool _pwVisible2 = false; // textBox4 (Password Again)

        public SignUp()
        {
            InitializeComponent();

            // ---- button1 için köşeleri yumuşat ----
            int radius = 25;
            button1.Region = new Region(RoundedRect(button1.ClientRectangle, radius));

            // ✅ Şifreleri gizli başlat
            textBox3.UseSystemPasswordChar = true;
            textBox4.UseSystemPasswordChar = true;

            // ✅ Varsayılan ikonlar: kapalı göz
            // NOT: Buradaki namespace projene göre değişebilir.
            pictureBox2.Image = global::SpotiyV2._0.Properties.Resources.GozKapali;
            pictureBox3.Image = global::SpotiyV2._0.Properties.Resources.GozKapali;

            // UX
            pictureBox2.Cursor = Cursors.Hand;
            pictureBox3.Cursor = Cursors.Hand;

            // ⚠️ Designer zaten Click eventlerini bağlıyor.
            // Burada tekrar += veya -= yapmıyoruz.
        }

        // ---- Yuvarlak köşe çizen fonksiyon ----
        private GraphicsPath RoundedRect(Rectangle bounds, int radius)
        {
            int diameter = radius * 2;
            GraphicsPath path = new GraphicsPath();

            path.AddArc(bounds.X, bounds.Y, diameter, diameter, 180, 90);
            path.AddArc(bounds.Right - diameter, bounds.Y, diameter, diameter, 270, 90);
            path.AddArc(bounds.Right - diameter, bounds.Bottom - diameter, diameter, diameter, 0, 90);
            path.AddArc(bounds.X, bounds.Bottom - diameter, diameter, diameter, 90, 90);
            path.CloseFigure();

            return path;
        }

        // ✅ Password gözü (pictureBox2 -> textBox3)
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            _pwVisible1 = !_pwVisible1;

            textBox3.UseSystemPasswordChar = !_pwVisible1;
            pictureBox2.Image = _pwVisible1
                ? global::SpotiyV2._0.Properties.Resources.GozAcik
                : global::SpotiyV2._0.Properties.Resources.GozKapali;
        }

        // ✅ Password(Again) gözü (pictureBox3 -> textBox4)
        private void pictureBox3_Click(object sender, EventArgs e)
        {
            _pwVisible2 = !_pwVisible2;

            textBox4.UseSystemPasswordChar = !_pwVisible2;
            pictureBox3.Image = _pwVisible2
                ? global::SpotiyV2._0.Properties.Resources.GozAcik
                : global::SpotiyV2._0.Properties.Resources.GozKapali;
        }

        // ✅ SIGN UP / KAYIT
        private void button1_Click_1(object sender, EventArgs e)
        {
            string email = textBox1.Text.Trim();
            string adSoyad = textBox2.Text.Trim();   // User Name alanın -> DB’de AdSoyad
            string sifre = textBox3.Text;
            string sifre2 = textBox4.Text;

            // 1) Boş kontrol
            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(adSoyad) ||
                string.IsNullOrWhiteSpace(sifre) ||
                string.IsNullOrWhiteSpace(sifre2))
            {
                MessageBox.Show("Tüm alanları doldur.");
                return;
            }

            // 2) Şifre eşleşme kontrol
            if (sifre != sifre2)
            {
                MessageBox.Show("Şifreler uyuşmuyor.");
                return;
            }

            try
            {
                using var conn = new MySqlConnection(connStr);
                conn.Open();

                // 3) Email veya AdSoyad zaten var mı?
                using (var checkCmd = new MySqlCommand(@"
                    SELECT COUNT(*)
                    FROM kullanicilar
                    WHERE Email = @email OR AdSoyad = @adSoyad;", conn))
                {
                    checkCmd.Parameters.AddWithValue("@email", email);
                    checkCmd.Parameters.AddWithValue("@adSoyad", adSoyad);

                    long count = (long)checkCmd.ExecuteScalar();
                    if (count > 0)
                    {
                        MessageBox.Show("Bu Email veya User Name zaten kayıtlı.");
                        return;
                    }
                }

                // 4) Insert (Rol=0 default, Durum=1 aktif, userPhoto=0)
                using (var insCmd = new MySqlCommand(@"
                    INSERT INTO kullanicilar (AdSoyad, Email, Sifre, Rol, Durum, userPhoto)
                    VALUES (@adSoyad, @email, @sifre, 0, 1, 0);", conn))
                {
                    insCmd.Parameters.AddWithValue("@adSoyad", adSoyad);
                    insCmd.Parameters.AddWithValue("@email", email);
                    insCmd.Parameters.AddWithValue("@sifre", sifre);

                    insCmd.ExecuteNonQuery();
                }

                MessageBox.Show("Kayıt başarılı! Giriş ekranına yönlendiriliyorsun.");

                // Login ekranına dön
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Kayıt hata: " + ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string email = textBox1.Text.Trim();
            string adSoyad = textBox2.Text.Trim(); // DB: AdSoyad
            string sifre = textBox3.Text;
            string sifre2 = textBox4.Text;

            // 1) Boş kontrol
            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(adSoyad) ||
                string.IsNullOrWhiteSpace(sifre) ||
                string.IsNullOrWhiteSpace(sifre2))
            {
                MessageBox.Show("Tüm alanları doldur.");
                return;
            }

            // 2) Şifre eşleşme
            if (sifre != sifre2)
            {
                MessageBox.Show("Şifreler uyuşmuyor.");
                return;
            }

            try
            {
                using var conn = new MySqlConnection(connStr);
                conn.Open();

                // 3) Email veya AdSoyad var mı?
                using (var checkCmd = new MySqlCommand(@"
                    SELECT COUNT(*)
                    FROM kullanicilar
                    WHERE Email = @email OR AdSoyad = @adSoyad;", conn))
                {
                    checkCmd.Parameters.AddWithValue("@email", email);
                    checkCmd.Parameters.AddWithValue("@adSoyad", adSoyad);

                    long count = Convert.ToInt64(checkCmd.ExecuteScalar());
                    if (count > 0)
                    {
                        MessageBox.Show("Bu Email veya User Name zaten kayıtlı.");
                        return;
                    }
                }

                // 4) Insert
                using (var insCmd = new MySqlCommand(@"
                    INSERT INTO kullanicilar (AdSoyad, Email, Sifre, Rol, Durum, userPhoto)
                    VALUES (@adSoyad, @email, @sifre, 0, 1, 0);", conn))
                {
                    insCmd.Parameters.AddWithValue("@adSoyad", adSoyad);
                    insCmd.Parameters.AddWithValue("@email", email);
                    insCmd.Parameters.AddWithValue("@sifre", sifre);
                    insCmd.ExecuteNonQuery();
                }

                MessageBox.Show("Kayıt başarılı! Giriş ekranına yönlendiriliyorsun.");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Kayıt hata: " + ex.Message);
            }
        }
    }
}
