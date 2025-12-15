using System.Drawing;

namespace SpotiyV2._0
{
    partial class SarkıEkle
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SarkıEkle));
            panel1 = new Panel();
            button3 = new Button();
            button2 = new Button();
            button1 = new Button();
            textBox2 = new TextBox();
            pictureBox2 = new PictureBox();
            pictureBox1 = new PictureBox();
            label1 = new Label();
            panel6 = new Panel();
            pictureBox27 = new PictureBox();
            pictureBox16 = new PictureBox();
            pictureBox19 = new PictureBox();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            panel6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox27).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox19).BeginInit();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(26, 26, 26);
            panel1.Controls.Add(button3);
            panel1.Controls.Add(button2);
            panel1.Controls.Add(button1);
            panel1.Controls.Add(textBox2);
            panel1.Controls.Add(pictureBox2);
            panel1.Controls.Add(pictureBox1);
            panel1.Controls.Add(label1);
            panel1.Location = new Point(648, 96);
            panel1.Name = "panel1";
            panel1.Size = new Size(674, 897);
            panel1.TabIndex = 12;
            // 
            // button3
            // 
            button3.Font = new Font("Elephant", 19.8000011F, FontStyle.Regular, GraphicsUnit.Point, 0);
            button3.Location = new Point(257, 802);
            button3.Name = "button3";
            button3.Size = new Size(183, 78);
            button3.TabIndex = 20;
            button3.Text = "İptal Et";
            button3.UseVisualStyleBackColor = true;
            button3.Click += button3_Click;
            // 
            // button2
            // 
            button2.Font = new Font("Elephant", 19.8000011F, FontStyle.Regular, GraphicsUnit.Point, 0);
            button2.Location = new Point(469, 802);
            button2.Name = "button2";
            button2.Size = new Size(183, 78);
            button2.TabIndex = 19;
            button2.Text = "Yükle";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // button1
            // 
            button1.Font = new Font("Elephant", 10.1999989F, FontStyle.Regular, GraphicsUnit.Point, 0);
            button1.Location = new Point(420, 520);
            button1.Name = "button1";
            button1.Size = new Size(119, 29);
            button1.TabIndex = 18;
            button1.Text = "Şarkı Seç";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // textBox2
            // 
            textBox2.Font = new Font("Elephant", 11.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            textBox2.Location = new Point(278, 450);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(260, 33);
            textBox2.TabIndex = 17;
            // 
            // pictureBox2
            // 
            pictureBox2.Image = (Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new Point(469, 290);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new Size(70, 70);
            pictureBox2.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox2.TabIndex = 15;
            pictureBox2.TabStop = false;
            pictureBox2.Click += pictureBox2_Click;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(203, 100);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(260, 260);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 14;
            pictureBox1.TabStop = false;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Elephant", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label1.ForeColor = SystemColors.ButtonFace;
            label1.Location = new Point(65, 453);
            label1.Name = "label1";
            label1.Size = new Size(121, 30);
            label1.TabIndex = 12;
            label1.Text = "Şarkı Adı";
            // 
            // panel6
            // 
            panel6.BackColor = Color.FromArgb(26, 26, 26);
            panel6.Controls.Add(pictureBox27);
            panel6.Controls.Add(pictureBox16);
            panel6.Controls.Add(pictureBox19);
            panel6.Dock = DockStyle.Top;
            panel6.Location = new Point(0, 0);
            panel6.Name = "panel6";
            panel6.Size = new Size(1902, 63);
            panel6.TabIndex = 13;
            // 
            // pictureBox27
            // 
            pictureBox27.Image = (Image)resources.GetObject("pictureBox27.Image");
            pictureBox27.Location = new Point(134, 3);
            pictureBox27.Name = "pictureBox27";
            pictureBox27.Size = new Size(55, 55);
            pictureBox27.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox27.TabIndex = 6;
            pictureBox27.TabStop = false;
            pictureBox27.Click += pictureBox27_Click;
            // 
            // pictureBox16
            // 
            pictureBox16.Image = (Image)resources.GetObject("pictureBox16.Image");
            pictureBox16.Location = new Point(73, 3);
            pictureBox16.Name = "pictureBox16";
            pictureBox16.Size = new Size(55, 55);
            pictureBox16.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox16.TabIndex = 5;
            pictureBox16.TabStop = false;
            pictureBox16.Click += pictureBox16_Click;
            // 
            // pictureBox19
            // 
            pictureBox19.Image = (Image)resources.GetObject("pictureBox19.Image");
            pictureBox19.Location = new Point(12, 3);
            pictureBox19.Name = "pictureBox19";
            pictureBox19.Size = new Size(55, 55);
            pictureBox19.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox19.TabIndex = 3;
            pictureBox19.TabStop = false;
            pictureBox19.Click += pictureBox19_Click;
            // 
            // SarkıEkle
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(50, 50, 50);
            ClientSize = new Size(1902, 1033);
            Controls.Add(panel6);
            Controls.Add(panel1);
            Name = "SarkıEkle";
            Text = "SarkıEkle";
            Load += SarkıEkle_Load;
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            panel6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox27).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox19).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private Button button2;
        private Button button1;
        private TextBox textBox2;
        private PictureBox pictureBox2;
        private PictureBox pictureBox1;
        private Label label1;
        private Button button3;
        private Panel panel6;
        private PictureBox pictureBox27;
        private PictureBox pictureBox16;
        private PictureBox pictureBox19;
    }
}
