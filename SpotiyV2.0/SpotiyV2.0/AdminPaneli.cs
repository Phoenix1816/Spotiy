#nullable disable
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace SpotiyV2._0
{
    public partial class AdminPaneli : Form
    {
        private readonly string baglantiKodu = "Server=localhost;Database=muzikapp;Uid=root;Pwd=;";

        // EnabledChanged handler’ları birden fazla eklenmesin diye bayrak
        private bool _styleEventsBound = false;

        public AdminPaneli()
        {
            InitializeComponent();

            // ✅ Event'leri garantiye al (Designer bazen koparıyor / yanlış bağlıyor)
            this.Load -= AdminPaneli_Load;
            this.Load += AdminPaneli_Load;

            button1.Click -= button1_Click_1;
            button1.Click += button1_Click_1;

            button2.Click -= button2_Click_1;
            button2.Click += button2_Click_1;

            dataGridView1.SelectionChanged -= DataGridView1_SelectionChanged;
            dataGridView1.SelectionChanged += DataGridView1_SelectionChanged;

            textBox1.TextChanged -= TextBox1_TextChanged;
            textBox1.TextChanged += TextBox1_TextChanged;

            // (Varsa) designer'ın koyduğu boş event
            dataGridView1.CellContentClick -= dataGridView1_CellContentClick;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
        }

        private void AdminPaneli_Load(object sender, EventArgs e)
        {
            // Panel tema + oval
            panel1.BackColor = Color.FromArgb(26, 26, 26);
            MakeRounded(panel1, 20);
            panel1.Resize -= Panel1_Resize;
            panel1.Resize += Panel1_Resize;

            // Grid stil
            StilDataGridView(dataGridView1);

            // Buton stil
            StilPrimarySari(button1);   // Banla
            StilSecondaryGri(button2);  // Banı Kaldır
            MakeRounded(button1, 12);
            MakeRounded(button2, 12);

            // DB'den çek
            KullaniciListesiniYukle();

            // ✅ ilk sanatçıyı seç (sanatçı yoksa ilk görünür satır)
            IlkSanatciyiSecYoksaIlkGorunur();
            ButonlariDurumaGoreAyarla();
        }

        private void Panel1_Resize(object sender, EventArgs e)
        {
            MakeRounded(panel1, 20);
        }

        private void DataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            ButonlariDurumaGoreAyarla();
        }

        private void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Filtrele(textBox1.Text);
            IlkSanatciyiSecYoksaIlkGorunur();
            ButonlariDurumaGoreAyarla();
        }

        // -------------------------
        // DB -> DataGridView
        // -------------------------
        private void KullaniciListesiniYukle()
        {
            try
            {
                dataGridView1.SuspendLayout();
                dataGridView1.Rows.Clear();

                using (var conn = new MySqlConnection(baglantiKodu))
                {
                    conn.Open();

                    using (var cmd = new MySqlCommand(
                        "SELECT KullaniciID, AdSoyad, Email, Rol, Durum FROM kullanicilar ORDER BY KullaniciID ASC",
                        conn))
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int id = Convert.ToInt32(reader["KullaniciID"]);

                            string ad = Convert.ToString(reader["AdSoyad"]) ?? "";
                            string email = Convert.ToString(reader["Email"]) ?? "";

                            int rolNo = Convert.ToInt32(reader["Rol"]);
                            int durumNo = Convert.ToInt32(reader["Durum"]);

                            string rolText = RolToText(rolNo);
                            string durumText = (durumNo == 1) ? "Aktif" : "Banlı";

                            int rowIndex = dataGridView1.Rows.Add(
                                id.ToString(),
                                ad,
                                email,
                                rolText,
                                durumText
                            );

                            // ✅ Rol/Durum int değerleri UI’dan bağımsız sakla
                            dataGridView1.Rows[rowIndex].Cells[3].Tag = rolNo;     // Rol int (0/1/2)
                            dataGridView1.Rows[rowIndex].Cells[4].Tag = durumNo;   // Durum int (0/1)
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Kullanıcılar yüklenemedi: " + ex.Message);
            }
            finally
            {
                dataGridView1.ResumeLayout();
            }
        }

        private string RolToText(int rol)
        {
            switch (rol)
            {
                case 0: return "Default";
                case 1: return "Admin";
                case 2: return "Sanatçı";
                default: return rol.ToString();
            }
        }

        // -------------------------
        // Arama / Filtre
        // -------------------------
        private void Filtrele(string q)
        {
            q = (q ?? "").Trim().ToLowerInvariant();

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.IsNewRow) continue;

                string id = (row.Cells[0].Value?.ToString() ?? "").ToLowerInvariant();
                string ad = (row.Cells[1].Value?.ToString() ?? "").ToLowerInvariant();
                string email = (row.Cells[2].Value?.ToString() ?? "").ToLowerInvariant();
                string rol = (row.Cells[3].Value?.ToString() ?? "").ToLowerInvariant();
                string durum = (row.Cells[4].Value?.ToString() ?? "").ToLowerInvariant();

                bool match =
                    id.Contains(q) || ad.Contains(q) || email.Contains(q) || rol.Contains(q) || durum.Contains(q);

                row.Visible = match || string.IsNullOrEmpty(q);
            }
        }

        // ✅ Önce ilk SANATÇI; yoksa ilk görünür satır
        private void IlkSanatciyiSecYoksaIlkGorunur()
        {
            dataGridView1.ClearSelection();

            // 1) sanatçı ara
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.IsNewRow) continue;
                if (!row.Visible) continue;

                var rolTag = row.Cells[3].Tag;
                if (rolTag == null) continue;

                if (Convert.ToInt32(rolTag) == 2)
                {
                    dataGridView1.CurrentCell = row.Cells[0];
                    row.Selected = true;
                    return;
                }
            }

            // 2) ilk görünür
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.IsNewRow) continue;
                if (!row.Visible) continue;

                dataGridView1.CurrentCell = row.Cells[0];
                row.Selected = true;
                return;
            }

            // hiç satır yok
            dataGridView1.CurrentCell = null;
        }

        // -------------------------
        // Seçili kullanıcı id
        // -------------------------
        private int? GetSelectedUserId()
        {
            if (dataGridView1.CurrentRow == null) return null;

            var val = dataGridView1.CurrentRow.Cells[0].Value?.ToString();
            if (int.TryParse(val, out int id)) return id;

            return null;
        }

        // -------------------------
        // Seçili kullanıcı sanatçı mı?
        // -------------------------
        private bool IsSelectedArtist()
        {
            if (dataGridView1.CurrentRow == null) return false;

            object tag = dataGridView1.CurrentRow.Cells[3].Tag;
            if (tag == null) return false;

            return Convert.ToInt32(tag) == 2; // 2 = sanatçı
        }

        // -------------------------
        // DB Update (Durum)
        // -------------------------
        private void SetUserDurum(int userId, int durum) // 0 banlı, 1 aktif
        {
            using (var conn = new MySqlConnection(baglantiKodu))
            {
                conn.Open();

                using (var cmd = new MySqlCommand(
                    "UPDATE kullanicilar SET Durum=@durum WHERE KullaniciID=@id AND Rol=2",
                    conn))
                {
                    cmd.Parameters.AddWithValue("@durum", durum);
                    cmd.Parameters.AddWithValue("@id", userId);

                    int affected = cmd.ExecuteNonQuery();
                    if (affected == 0)
                        throw new Exception("Güncelleme yapılamadı (kullanıcı sanatçı değil veya kayıt yok).");
                }
            }
        }

        // -------------------------
        // Duruma göre buton aktif/pasif
        // -------------------------
        private void ButonlariDurumaGoreAyarla()
        {
            if (dataGridView1.CurrentRow == null || !IsSelectedArtist())
            {
                button1.Enabled = false;
                button2.Enabled = false;
                return;
            }

            object tag = dataGridView1.CurrentRow.Cells[4].Tag;
            int durumNo = (tag == null) ? -1 : Convert.ToInt32(tag);

            bool banliMi = (durumNo == 0);

            button1.Enabled = !banliMi; // Banla
            button2.Enabled = banliMi;  // Banı Kaldır
        }

        // -------------------------
        // Banla -> Durum=0
        // -------------------------
        private void button1_Click_1(object sender, EventArgs e)
        {
            var userId = GetSelectedUserId();
            if (userId == null) return;

            if (!IsSelectedArtist())
            {
                MessageBox.Show("Sadece sanatçı banlayabilirsin.");
                return;
            }

            try
            {
                SetUserDurum(userId.Value, 0);

                dataGridView1.CurrentRow.Cells[4].Value = "Banlı";
                dataGridView1.CurrentRow.Cells[4].Tag = 0;

                ButonlariDurumaGoreAyarla();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Banlama hatası: " + ex.Message);
            }
        }

        // -------------------------
        // Banı Kaldır -> Durum=1
        // -------------------------
        private void button2_Click_1(object sender, EventArgs e)
        {
            var userId = GetSelectedUserId();
            if (userId == null) return;

            if (!IsSelectedArtist())
            {
                MessageBox.Show("Sadece sanatçı için ban kaldırabilirsin.");
                return;
            }

            try
            {
                SetUserDurum(userId.Value, 1);

                dataGridView1.CurrentRow.Cells[4].Value = "Aktif";
                dataGridView1.CurrentRow.Cells[4].Tag = 1;

                ButonlariDurumaGoreAyarla();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ban kaldırma hatası: " + ex.Message);
            }
        }

        // =========================
        // Designer'ın istediği event
        // =========================
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // boş kalsın (designer istiyor)
        }

        // =========================
        // Navigation
        // =========================
        private void pictureBox16_Click(object sender, EventArgs e)
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

        private void pictureBox27_Click(object sender, EventArgs e)
        {
            try
            {
                using (var about = new AboutUs())
                {
                    if (this.Owner != null) about.Owner = this.Owner;

                    this.Hide();
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

        private void pictureBox19_Click(object sender, EventArgs e)
        {
            // ✅ Owner varsa ona dön, yoksa Form1'i bul
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

        // -------------------------
        // Grid Stil
        // -------------------------
        private void StilDataGridView(DataGridView dgv)
        {
            dgv.EnableHeadersVisualStyles = false;

            dgv.BackgroundColor = Color.FromArgb(26, 26, 26);
            dgv.GridColor = Color.FromArgb(45, 45, 45);

            dgv.BorderStyle = BorderStyle.None;
            dgv.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;
            dgv.RowHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;

            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(35, 35, 35);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgv.ColumnHeadersHeight = 40;

            dgv.DefaultCellStyle.BackColor = Color.FromArgb(26, 26, 26);
            dgv.DefaultCellStyle.ForeColor = Color.White;

            dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(255, 200, 0);
            dgv.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgv.RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(255, 200, 0);
            dgv.RowsDefaultCellStyle.SelectionForeColor = Color.Black;

            dgv.RowTemplate.Height = 36;
            dgv.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgv.MultiSelect = false;
            dgv.ReadOnly = true;

            dgv.AllowUserToAddRows = false;
            dgv.AllowUserToDeleteRows = false;
            dgv.AllowUserToResizeRows = false;

            dgv.RowHeadersVisible = false;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        // -------------------------
        // Primary Sarı Buton (Banla)
        // -------------------------
        private void StilPrimarySari(Button btn)
        {
            btn.BackColor = Color.FromArgb(255, 200, 0);
            btn.ForeColor = Color.Black;
            btn.FlatStyle = FlatStyle.Flat;
            btn.FlatAppearance.BorderSize = 0;
            btn.Cursor = Cursors.Hand;

            // ✅ Handler çoğalmasın (Load tekrar çağrılırsa bile)
            if (!_styleEventsBound)
            {
                btn.EnabledChanged += (s, e) =>
                {
                    if (!btn.Enabled)
                    {
                        btn.BackColor = Color.FromArgb(120, 120, 120);
                        btn.ForeColor = Color.FromArgb(230, 230, 230);
                    }
                    else
                    {
                        btn.BackColor = Color.FromArgb(255, 200, 0);
                        btn.ForeColor = Color.Black;
                    }
                };
            }

            _styleEventsBound = true;
        }

        // -------------------------
        // Secondary Gri Buton (Banı Kaldır)
        // -------------------------
        private void StilSecondaryGri(Button btn)
        {
            btn.BackColor = Color.FromArgb(60, 60, 60);
            btn.ForeColor = Color.White;
            btn.FlatStyle = FlatStyle.Flat;
            btn.FlatAppearance.BorderSize = 0;
            btn.Cursor = Cursors.Hand;

            // ✅ Handler çoğalmasın
            if (!_styleEventsBound)
            {
                btn.EnabledChanged += (s, e) =>
                {
                    if (!btn.Enabled)
                    {
                        btn.BackColor = Color.FromArgb(45, 45, 45);
                        btn.ForeColor = Color.FromArgb(160, 160, 160);
                    }
                    else
                    {
                        btn.BackColor = Color.FromArgb(60, 60, 60);
                        btn.ForeColor = Color.White;
                    }
                };
            }

            _styleEventsBound = true;
        }

        // -------------------------
        // Oval köşe
        // -------------------------
        private void MakeRounded(Control control, int radius)
        {
            if (control == null) return;
            if (control.Width <= 0 || control.Height <= 0) return;

            int d = radius * 2;
            if (d > control.Width) d = control.Width;
            if (d > control.Height) d = control.Height;

            using (GraphicsPath path = new GraphicsPath())
            {
                path.StartFigure();
                path.AddArc(0, 0, d, d, 180, 90);
                path.AddArc(control.Width - d, 0, d, d, 270, 90);
                path.AddArc(control.Width - d, control.Height - d, d, d, 0, 90);
                path.AddArc(0, control.Height - d, d, d, 90, 90);
                path.CloseFigure();

                control.Region = new Region(path);
            }
        }

        private void panel6_Paint(object sender, PaintEventArgs e)
        {
            // boş
        }
    }
}
