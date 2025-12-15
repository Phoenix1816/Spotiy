#nullable disable
using System.Drawing;
using System.Windows.Forms;

namespace music
{
    partial class MusicBar
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
                components.Dispose();

            base.Dispose(disposing);
        }

        #region Component Designer generated code

        private void InitializeComponent()
        {
            sarkiPhoto = new PictureBox();
            panel1 = new Panel();
            label1 = new Label();
            sanatçı_hakkında_bilgi = new RichTextBox();
            panel2 = new Panel();
            SarkiSozleri = new RichTextBox();
            sarkıSözleri = new Label();
            Sanatçı = new Label();
            Sarki = new Label();
            ((System.ComponentModel.ISupportInitialize)sarkiPhoto).BeginInit();
            panel1.SuspendLayout();
            panel2.SuspendLayout();
            SuspendLayout();
            // 
            // sarkiPhoto
            // 
            sarkiPhoto.BackgroundImageLayout = ImageLayout.Stretch;
            sarkiPhoto.Location = new Point(75, 119);
            sarkiPhoto.Margin = new Padding(3, 4, 3, 4);
            sarkiPhoto.Name = "sarkiPhoto";
            sarkiPhoto.Size = new Size(229, 223);
            sarkiPhoto.SizeMode = PictureBoxSizeMode.StretchImage;
            sarkiPhoto.TabIndex = 1;
            sarkiPhoto.TabStop = false;
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(50, 50, 50);
            panel1.Controls.Add(label1);
            panel1.Controls.Add(sanatçı_hakkında_bilgi);
            panel1.Location = new Point(30, 697);
            panel1.Margin = new Padding(3, 4, 3, 4);
            panel1.Name = "panel1";
            panel1.Size = new Size(339, 315);
            panel1.TabIndex = 4;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Elephant", 9F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.ForeColor = Color.White;
            label1.Location = new Point(30, 24);
            label1.Name = "label1";
            label1.Size = new Size(88, 20);
            label1.TabIndex = 6;
            label1.Text = "Biyografi";
            // 
            // sanatçı_hakkında_bilgi
            // 
            sanatçı_hakkında_bilgi.BackColor = Color.DimGray;
            sanatçı_hakkında_bilgi.BorderStyle = BorderStyle.None;
            sanatçı_hakkında_bilgi.Font = new Font("Calibri", 10.2F, FontStyle.Regular, GraphicsUnit.Point, 162);
            sanatçı_hakkında_bilgi.ForeColor = Color.White;
            sanatçı_hakkında_bilgi.Location = new Point(31, 61);
            sanatçı_hakkında_bilgi.Margin = new Padding(3, 4, 3, 4);
            sanatçı_hakkında_bilgi.Name = "sanatçı_hakkında_bilgi";
            sanatçı_hakkında_bilgi.ReadOnly = true;
            sanatçı_hakkında_bilgi.Size = new Size(279, 229);
            sanatçı_hakkında_bilgi.TabIndex = 5;
            sanatçı_hakkında_bilgi.Text = "sanatçı hakkında bilgi";
            // 
            // panel2
            // 
            panel2.BackColor = Color.FromArgb(50, 50, 50);
            panel2.Controls.Add(SarkiSozleri);
            panel2.Controls.Add(sarkıSözleri);
            panel2.ForeColor = Color.White;
            panel2.Location = new Point(30, 376);
            panel2.Margin = new Padding(3, 4, 3, 4);
            panel2.Name = "panel2";
            panel2.Size = new Size(339, 291);
            panel2.TabIndex = 5;
            // 
            // SarkiSozleri
            // 
            SarkiSozleri.BackColor = Color.DimGray;
            SarkiSozleri.BorderStyle = BorderStyle.None;
            SarkiSozleri.Font = new Font("Calibri", 10.8F, FontStyle.Regular, GraphicsUnit.Point, 162);
            SarkiSozleri.ForeColor = Color.White;
            SarkiSozleri.Location = new Point(30, 54);
            SarkiSozleri.Margin = new Padding(3, 4, 3, 4);
            SarkiSozleri.Name = "SarkiSozleri";
            SarkiSozleri.ReadOnly = true;
            SarkiSozleri.RightToLeft = RightToLeft.No;
            SarkiSozleri.Size = new Size(279, 215);
            SarkiSozleri.TabIndex = 0;
            SarkiSozleri.Text = "Şarkı Sözleri";
            // 
            // sarkıSözleri
            // 
            sarkıSözleri.AutoSize = true;
            sarkıSözleri.BackColor = Color.Transparent;
            sarkıSözleri.Font = new Font("Elephant", 10.1999989F, FontStyle.Regular, GraphicsUnit.Point, 0);
            sarkıSözleri.ForeColor = Color.White;
            sarkıSözleri.Location = new Point(30, 14);
            sarkıSözleri.Name = "sarkıSözleri";
            sarkıSözleri.Size = new Size(123, 22);
            sarkıSözleri.TabIndex = 6;
            sarkıSözleri.Text = "Şarkı Sözleri";
            // 
            // Sanatçı
            // 
            Sanatçı.AutoSize = true;
            Sanatçı.BackColor = Color.Transparent;
            Sanatçı.Font = new Font("Elephant", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Sanatçı.ForeColor = SystemColors.ButtonFace;
            Sanatçı.Location = new Point(43, 29);
            Sanatçı.Name = "Sanatçı";
            Sanatçı.Size = new Size(99, 30);
            Sanatçı.TabIndex = 7;
            Sanatçı.Text = "Sanatçı";
            Sanatçı.Click += Sanatçı_Click;
            // 
            // Sarki
            // 
            Sarki.AutoSize = true;
            Sarki.BackColor = Color.Transparent;
            Sarki.Font = new Font("Elephant", 10.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Sarki.ForeColor = SystemColors.ButtonShadow;
            Sarki.Location = new Point(47, 68);
            Sarki.Name = "Sarki";
            Sarki.Size = new Size(59, 24);
            Sarki.TabIndex = 8;
            Sarki.Text = "Şarkı";
            // 
            // MusicBar
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            AutoScroll = true;
            BackColor = Color.FromArgb(26, 26, 26);
            BorderStyle = BorderStyle.FixedSingle;
            Controls.Add(Sarki);
            Controls.Add(Sanatçı);
            Controls.Add(panel1);
            Controls.Add(panel2);
            Controls.Add(sarkiPhoto);
            Margin = new Padding(3, 4, 3, 4);
            Name = "MusicBar";
            Size = new Size(410, 1036);
            ((System.ComponentModel.ISupportInitialize)sarkiPhoto).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private PictureBox sarkiPhoto;
        private Panel panel1;
        private RichTextBox sanatçı_hakkında_bilgi;
        private Panel panel2;
        private Label sarkıSözleri;
        private Label Sanatçı;
        private Label Sarki;
        private RichTextBox SarkiSozleri;
        private Label label1;
    }
}
