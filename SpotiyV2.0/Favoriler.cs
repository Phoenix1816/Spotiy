#nullable disable
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace SpotiyV2._0
{
    public partial class Favoriler : Form
    {
        private readonly string baglantiKodu = "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        private FlowLayoutPanel flp;

        public Favoriler()
        {
            InitializeComponent();

            // ✅ Event’i garantiye al (Designer + kod aynı anda bağlanıp 2 kez çalışmasın)
            this.Load -= Favoriler_Load;
            this.Load += Favoriler_Load;

            pictureBox4.Click -= pictureBox4_Click;
            pictureBox4.Click += pictureBox4_Click;

            pictureBox3.Click -= pictureBox3_Click;
            pictureBox3.Click += pictureBox3_Click;

            pictureBox5.Click -= pictureBox5_Click;
            pictureBox5.Click += pictureBox5_Click;
        }

        private void Favoriler_Load(object sender, EventArgs e)
        {
            SetupListContainer();
            LoadFavorites();
        }

        private void SetupListContainer()
        {
            // ✅ tekrar tekrar oluşturmak yerine varsa reuse et
            if (flp != null && !flp.IsDisposed && panel1.Controls.Contains(flp))
            {
                flp.BackColor = Color.FromArgb(26, 26, 26);
                return;
            }

            panel1.Controls.Clear();

            flp = new FlowLayoutPanel();
            flp.Dock = DockStyle.Fill;
            flp.AutoScroll = true;
            flp.WrapContents = false;
            flp.FlowDirection = FlowDirection.TopDown;
            flp.BackColor = Color.FromArgb(26, 26, 26);

            panel1.Controls.Add(flp);
        }

        // ✅ KULLANICIYA ÖZEL Favoriler ListeID (yoksa oluştur)
        private int GetOrCreateUserFavorilerListeId(MySqlConnection conn, int kullaniciId)
        {
            using (var cmd = new MySqlCommand(@"
SELECT ListeID
FROM listeler
WHERE KullaniciID=@uid AND Ad='Favoriler'
LIMIT 1;", conn))
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

        private void LoadFavorites()
        {
            try
            {
                // ✅ giriş kontrol
                if (Form1.CurrentKullaniciID <= 0)
                {
                    label2.Text = "Şarkı Sayısı: 0";
                    flp.Controls.Clear();
                    flp.Controls.Add(CreateInfoItem("Önce giriş yapmalısın."));
                    SafeSetPictureBoxImage(pictureBox1, null);
                    return;
                }

                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();

                    // ✅ kullanıcıya özel Favoriler ListeID
                    int favorilerListeId = GetOrCreateUserFavorilerListeId(conn, Form1.CurrentKullaniciID);
                    if (favorilerListeId <= 0)
                    {
                        label2.Text = "Şarkı Sayısı: 0";
                        flp.Controls.Clear();
                        flp.Controls.Add(CreateInfoItem("Favoriler listesi oluşturulamadı."));
                        SafeSetPictureBoxImage(pictureBox1, null);
                        return;
                    }

                    using (var cmd = new MySqlCommand(@"
SELECT 
    m.MuzikID,
    m.SarkiAdi,
    m.SanatciAdi,
    IFNULL(m.pictures,'') AS pictures
FROM playlistmuzik pm
INNER JOIN muzikler m ON m.MuzikID = pm.MuzikID
WHERE pm.ListeID = @lid AND pm.KullaniciID = @uid
ORDER BY pm.SiraNo;", conn))
                    {
                        cmd.Parameters.AddWithValue("@lid", favorilerListeId);
                        cmd.Parameters.AddWithValue("@uid", Form1.CurrentKullaniciID);

                        using (var rd = cmd.ExecuteReader())
                        {
                            flp.SuspendLayout();
                            flp.Controls.Clear();

                            int count = 0;
                            string firstCover = "";

                            while (rd.Read())
                            {
                                count++;

                                int muzikId = rd["MuzikID"] == DBNull.Value ? 0 : Convert.ToInt32(rd["MuzikID"]);
                                string sarkiAdi = rd["SarkiAdi"]?.ToString() ?? "Bilinmiyor";
                                string sanatciAdi = rd["SanatciAdi"]?.ToString() ?? "Bilinmiyor";
                                string coverDbPath = rd["pictures"]?.ToString() ?? "";

                                if (count == 1) firstCover = coverDbPath;

                                var item = CreateSongItem(muzikId, sarkiAdi, sanatciAdi, coverDbPath, favorilerListeId);
                                flp.Controls.Add(item);
                            }

                            label2.Text = $"Şarkı Sayısı: {count}";

                            if (!string.IsNullOrWhiteSpace(firstCover))
                            {
                                var img = TryLoadImageFromDbPath(firstCover);
                                SafeSetPictureBoxImage(pictureBox1, img);
                            }
                            else
                            {
                                SafeSetPictureBoxImage(pictureBox1, null);
                            }

                            if (count == 0)
                                flp.Controls.Add(CreateInfoItem("Favoriler listen boş."));

                            flp.ResumeLayout();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Favoriler yüklenemedi: " + ex.Message);
            }
        }

        // =========================
        // ✅ UI: Şarkı kartı (tıklayınca çalma)
        // =========================
        private Panel CreateSongItem(int muzikId, string sarkiAdi, string sanatciAdi, string coverDbPath, int favorilerListeId)
        {
            var card = new Panel();
            card.Width = 1600;
            card.Height = 90;
            card.Margin = new Padding(18, 12, 18, 0);
            card.BackColor = Color.FromArgb(50, 50, 50);
            card.Cursor = Cursors.Hand;

            var pb = new PictureBox();
            pb.Location = new Point(10, 5);
            pb.Size = new Size(84, 84);
            pb.SizeMode = PictureBoxSizeMode.StretchImage;
            pb.BackColor = Color.FromArgb(35, 35, 35);

            var img = TryLoadImageFromDbPath(coverDbPath);
            if (img != null) SafeSetPictureBoxImage(pb, img);

            var lblSong = new Label();
            lblSong.AutoSize = true;
            lblSong.Location = new Point(133, 18);
            lblSong.Font = new Font("Elephant", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            lblSong.ForeColor = SystemColors.ButtonFace;
            lblSong.Text = sarkiAdi;
            lblSong.Cursor = Cursors.Hand;

            var lblArtist = new Label();
            lblArtist.AutoSize = true;
            lblArtist.Location = new Point(133, 55);
            lblArtist.Font = new Font("Elephant", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            lblArtist.ForeColor = SystemColors.ButtonShadow;
            lblArtist.Text = sanatciAdi;
            lblArtist.Cursor = Cursors.Hand;

            void hoverOn(object s, EventArgs e) => card.BackColor = Color.FromArgb(65, 65, 65);
            void hoverOff(object s, EventArgs e) => card.BackColor = Color.FromArgb(50, 50, 50);

            card.MouseEnter += hoverOn; card.MouseLeave += hoverOff;
            pb.MouseEnter += hoverOn; pb.MouseLeave += hoverOff;
            lblSong.MouseEnter += hoverOn; lblSong.MouseLeave += hoverOff;
            lblArtist.MouseEnter += hoverOn; lblArtist.MouseLeave += hoverOff;

            void selectSong(object s, EventArgs e)
            {
                if (muzikId <= 0) return;

                // ✅ Owner Form1 değilse fallback ile bul
                var f = this.Owner as Form1 ?? Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Form1) as Form1;

                if (f != null)
                {
                    f.StartPlaylistPlayback(favorilerListeId, muzikId);
                }

                this.Close();
            }

            card.Click += selectSong;
            pb.Click += selectSong;
            lblSong.Click += selectSong;
            lblArtist.Click += selectSong;

            card.Controls.Add(pb);
            card.Controls.Add(lblSong);
            card.Controls.Add(lblArtist);

            MakeRounded(card, 14);
            return card;
        }

        private Panel CreateInfoItem(string text)
        {
            var card = new Panel();
            card.Width = 1600;
            card.Height = 70;
            card.Margin = new Padding(18, 12, 18, 0);
            card.BackColor = Color.FromArgb(50, 50, 50);

            var lbl = new Label();
            lbl.AutoSize = true;
            lbl.Location = new Point(20, 22);
            lbl.Font = new Font("Elephant", 11.0F);
            lbl.ForeColor = SystemColors.ButtonShadow;
            lbl.Text = text;

            card.Controls.Add(lbl);
            MakeRounded(card, 14);
            return card;
        }

        // =========================
        // ✅ DB’deki /pictures/... yolundan resim yükle
        // =========================
        private Image TryLoadImageFromDbPath(string dbPath)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(dbPath)) return null;

                string baseDir = Application.StartupPath;
                string normalized = dbPath.Replace("/", "\\").TrimStart('\\');

                string try1 = Path.Combine(baseDir, normalized);
                string projectRoot = Directory.GetParent(baseDir)?.Parent?.Parent?.FullName;
                string try2 = projectRoot == null ? "" : Path.Combine(projectRoot, normalized);

                string finalPath = File.Exists(try1) ? try1 : (File.Exists(try2) ? try2 : "");
                if (string.IsNullOrWhiteSpace(finalPath)) return null;

                // ✅ dosya kilitlemesin
                using (var fs = new FileStream(finalPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                using (var img = Image.FromStream(fs))
                    return new Bitmap(img);
            }
            catch
            {
                return null;
            }
        }

        // ✅ PictureBox image değişirken eskiyi dispose et (GDI leak önle)
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

        private void MakeRounded(Control c, int r)
        {
            try
            {
                if (c == null) return;
                if (c.Width <= 0 || c.Height <= 0) return;

                int d = r * 2;
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
            catch { }
        }

        // =========================
        // Navigation eventlerin
        // =========================
        private void pictureBox4_Click(object sender, EventArgs e)
        {
            // ✅ Owner varsa ona dön, yoksa Form1’i bul
            var back = this.Owner ?? Application.OpenForms.Cast<Form>().FirstOrDefault(f => f is Form1);

            if (back != null)
            {
                try
                {
                    back.Show();
                    back.WindowState = FormWindowState.Normal;
                    back.Activate();
                    back.BringToFront();
                }
                catch { }
            }

            this.Close();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            try
            {
                using (var da = new DefaultAyarlar())
                {
                    if (this.Owner != null) da.Owner = this.Owner;

                    this.Hide();
                    da.ShowDialog(this);
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

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            try
            {
                using (var da = new AboutUs())
                {
                    if (this.Owner != null) da.Owner = this.Owner;

                    this.Hide();
                    da.ShowDialog(this);
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

        private void panel2_Paint(object sender, PaintEventArgs e)
        {
        }
    }
}
