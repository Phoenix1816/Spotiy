using MySql.Data.MySqlClient;
using SpotiyV2._0;
using System;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace LoginSginupResetPassword
{
    public partial class Account : Form
    {
        private bool passwordVisible = false;

        // ✅ MySQL bağlantı stringi
        private readonly string connStr = "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        public Account()
        {
            InitializeComponent();

            // ✅ Event'leri garantiye al (Designer bazen koparabiliyor / yanlış bağlayabiliyor)
            this.Load -= Account_Load;
            this.Load += Account_Load;

            pictureBox2.Click -= pictureBox2_Click;
            pictureBox2.Click += pictureBox2_Click;

            // button1 = SignUp, button2 = Login
            button1.Click -= button1_Click;
            button1.Click += button1_Click;

            button2.Click -= button2_Click;
            button2.Click += button2_Click;

            // Rounded için resize'da tekrar uygula
            this.Shown += (s, e) => ApplyButtonStyles();
            this.Resize += (s, e) => ApplyButtonStyles();
        }

        private void ApplyButtonStyles()
        {
            try
            {
                MakeRounded(button1, 25);
                MakeRounded(button2, 25);

                button1.FlatStyle = FlatStyle.Flat;
                button1.FlatAppearance.BorderSize = 0;

                button2.FlatStyle = FlatStyle.Flat;
                button2.FlatAppearance.BorderSize = 0;
            }
            catch { }
        }

        private void MakeRounded(Button btn, int radius)
        {
            if (btn == null) return;
            if (btn.Width <= 0 || btn.Height <= 0) return;

            int d = radius * 2;
            if (d > btn.Width) d = btn.Width;
            if (d > btn.Height) d = btn.Height;

            using (GraphicsPath path = new GraphicsPath())
            {
                path.StartFigure();
                path.AddArc(new Rectangle(0, 0, d, d), 180, 90);
                path.AddArc(new Rectangle(btn.Width - d, 0, d, d), 270, 90);
                path.AddArc(new Rectangle(btn.Width - d, btn.Height - d, d, d), 0, 90);
                path.AddArc(new Rectangle(0, btn.Height - d, d, d), 90, 90);
                path.CloseFigure();

                btn.Region = new Region(path);
            }
        }

        private void Account_Load(object sender, EventArgs e)
        {
            ApplyButtonStyles();

            // 🔒 şifre gizli başlasın
            textBox3.UseSystemPasswordChar = true;

            // 👁 göz ayarları
            pictureBox2.Cursor = Cursors.Hand;
            pictureBox2.BringToFront();

            // 🔒 default kapalı göz
            pictureBox2.Image = global::SpotiyV2._0.Properties.Resources.GozKapali;
        }

        // 🔥 GÖZ TIKLANDI → HEM ŞİFRE HEM İKON DEĞİŞİR
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            passwordVisible = !passwordVisible;

            textBox3.UseSystemPasswordChar = !passwordVisible;

            pictureBox2.Image = passwordVisible
                ? global::SpotiyV2._0.Properties.Resources.GozAcik
                : global::SpotiyV2._0.Properties.Resources.GozKapali;
        }

        // ----------------------------
        // SIGN UP (TEK HANDLER)
        // ----------------------------
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (var signup = new SignUp())
                {
                    this.Hide();
                    signup.ShowDialog(this); // Owner verelim
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

        // ----------------------------
        // LOG IN
        // ----------------------------
        private void button2_Click(object sender, EventArgs e)
        {
            string loginText = textBox1.Text.Trim();
            string password = textBox3.Text;

            if (string.IsNullOrWhiteSpace(loginText) || string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Username/Email ve Password boş olamaz.");
                return;
            }

            try
            {
                using (var conn = new MySqlConnection(connStr))
                {
                    conn.Open();

                    using (var cmd = new MySqlCommand(@"
SELECT KullaniciID, Rol
FROM kullanicilar
WHERE (AdSoyad = @login OR Email = @login)
  AND Sifre = @p
  AND Durum = 1
LIMIT 1;", conn))
                    {
                        cmd.Parameters.AddWithValue("@login", loginText);
                        cmd.Parameters.AddWithValue("@p", password);

                        using (var rdr = cmd.ExecuteReader(CommandBehavior.SingleRow))
                        {
                            if (!rdr.Read())
                            {
                                MessageBox.Show("Bilgiler yanlış veya hesap pasif.");
                                return;
                            }

                            int kullaniciId = rdr.GetInt32("KullaniciID");
                            int rol = rdr.GetInt32("Rol");

                            // ✅ global session değerleri
                            Form1.CurrentKullaniciID = kullaniciId;
                            DefaultAyarlar.Rol = rol;
                        }
                    }
                }

                // ✅ Login başarılı → Form1 aç
                try
                {
                    using (var main = new Form1())
                    {
                        this.Hide();
                        main.ShowDialog(this);
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
            catch (Exception ex)
            {
                MessageBox.Show("Login hata: " + ex.Message);
            }
        }

        // ❌ ESKİ ÇİFT HANDLER'I KALDIRDIK:
        // private void button1_Click_1(object sender, EventArgs e) { ... }
        // Designer'da button1.Click -> button1_Click olacak.
    }
}
