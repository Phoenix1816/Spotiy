using System;
using System.Linq;
using System.Windows.Forms;

namespace SpotiyV2._0
{
    public partial class AboutUs : Form
    {
        public AboutUs()
        {
            InitializeComponent();

            // Küçük UX (istersen kaldırabilirsin)
            this.Load += AboutUs_Load;
        }

        private void AboutUs_Load(object sender, EventArgs e)
        {
            try
            {
                pictureBox16.Cursor = Cursors.Hand;
                pictureBox19.Cursor = Cursors.Hand;

                pictureBox16.BringToFront();
                pictureBox19.BringToFront();
            }
            catch { /* designer objeleri bazen null olabilir */ }
        }

        private void pictureBox16_Click(object sender, EventArgs e)
        {
            // DefaultAyarlar'ı modal aç
            // Hide/Show bug riskine karşı finally ile garanti altına al
            try
            {
                using (var da = new DefaultAyarlar())
                {
                    // Eğer AboutUs bir formdan açıldıysa, asıl geri dönmek istediğin form Owner'dır.
                    // DefaultAyarlar için Owner'ı da aynı Owner'a bağlamak daha sağlıklı olur.
                    if (this.Owner != null)
                        da.Owner = this.Owner;

                    this.Hide();
                    da.ShowDialog(this); // modal
                }
            }
            finally
            {
                // Her durumda AboutUs geri gelsin
                this.Show();
                this.WindowState = FormWindowState.Normal;
                this.Activate();
                this.BringToFront();
            }
        }

        private void pictureBox19_Click(object sender, EventArgs e)
        {
            // Geri dönüş: 1) Owner varsa Owner'a dön
            if (this.Owner != null)
            {
                ShowAndFocusForm(this.Owner);
                this.Close();
                return;
            }

            // 2) Owner yoksa açık formlardan Form1'i bulup dön (fallback)
            var form1 = Application.OpenForms
                .Cast<Form>()
                .FirstOrDefault(f => f is Form1);

            if (form1 != null)
            {
                ShowAndFocusForm(form1);
                this.Close();
                return;
            }

            // 3) Hiçbir şey yoksa sadece kapat
            this.Close();
        }

        private static void ShowAndFocusForm(Form f)
        {
            try
            {
                if (f.IsDisposed) return;

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
