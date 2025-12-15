using System;
using System.Drawing;
using System.Windows.Forms;

namespace SpotiyV2._0
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            panel2 = new Panel();
            pictureBox18 = new PictureBox();
            pictureBox17 = new PictureBox();
            pictureBox15 = new PictureBox();
            trackBar2 = new FlatTrackBar();
            label20 = new Label();
            label19 = new Label();
            label6 = new Label();
            label5 = new Label();
            pictureBox8 = new PictureBox();
            pictureBox3 = new PictureBox();
            pictureBox2 = new PictureBox();
            pictureBox1 = new PictureBox();
            trackBar1 = new FlatTrackBar();
            panel13 = new Panel();
            timer1 = new System.Windows.Forms.Timer(components);
            panel7 = new Panel();
            panel8 = new Panel();
            panel9 = new Panel();
            panel10 = new Panel();
            panel12 = new Panel();
            panel4 = new Panel();
            panel14 = new Panel();
            pictureBox21 = new PictureBox();
            label8 = new Label();
            label7 = new Label();
            pictureBox9 = new PictureBox();
            panel1 = new Panel();
            pictureBox4 = new PictureBox();
            panel3 = new Panel();
            label2 = new Label();
            pictureBox5 = new PictureBox();
            label1 = new Label();
            contextMenuStrip1 = new ContextMenuStrip(components);
            pictureBox16 = new PictureBox();
            panel6 = new Panel();
            pictureBox27 = new PictureBox();
            panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox18).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox17).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox15).BeginInit();
            ((System.ComponentModel.ISupportInitialize)trackBar2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox8).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox3).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)trackBar1).BeginInit();
            panel7.SuspendLayout();
            panel8.SuspendLayout();
            panel9.SuspendLayout();
            panel10.SuspendLayout();
            panel12.SuspendLayout();
            panel4.SuspendLayout();
            panel14.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox21).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox9).BeginInit();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox4).BeginInit();
            panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox5).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).BeginInit();
            panel6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox27).BeginInit();
            SuspendLayout();
            // 
            // panel2
            // 
            panel2.BackColor = Color.FromArgb(26, 26, 26);
            panel2.Controls.Add(pictureBox18);
            panel2.Controls.Add(pictureBox17);
            panel2.Controls.Add(pictureBox15);
            panel2.Controls.Add(trackBar2);
            panel2.Controls.Add(label20);
            panel2.Controls.Add(label19);
            panel2.Controls.Add(label6);
            panel2.Controls.Add(label5);
            panel2.Controls.Add(pictureBox8);
            panel2.Controls.Add(pictureBox3);
            panel2.Controls.Add(pictureBox2);
            panel2.Controls.Add(pictureBox1);
            panel2.Controls.Add(trackBar1);
            panel2.Dock = DockStyle.Bottom;
            panel2.Location = new Point(0, 861);
            panel2.Name = "panel2";
            panel2.Size = new Size(1902, 172);
            panel2.TabIndex = 1;
            // 
            // pictureBox18
            // 
            pictureBox18.Image = Properties.Resources.LoopPassive;
            pictureBox18.Location = new Point(1176, 9);
            pictureBox18.Name = "pictureBox18";
            pictureBox18.Size = new Size(57, 64);
            pictureBox18.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox18.TabIndex = 14;
            pictureBox18.TabStop = false;
            // 
            // pictureBox17
            // 
            pictureBox17.Image = Properties.Resources.RandomPassive;
            pictureBox17.Location = new Point(857, 13);
            pictureBox17.Name = "pictureBox17";
            pictureBox17.Size = new Size(65, 61);
            pictureBox17.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox17.TabIndex = 13;
            pictureBox17.TabStop = false;
            // 
            // pictureBox15
            // 
            pictureBox15.Image = (Image)resources.GetObject("pictureBox15.Image");
            pictureBox15.Location = new Point(304, 72);
            pictureBox15.Name = "pictureBox15";
            pictureBox15.Size = new Size(36, 34);
            pictureBox15.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox15.TabIndex = 12;
            pictureBox15.TabStop = false;
            pictureBox15.Click += pictureBox15_Click;
            // 
            // trackBar2
            // 
            trackBar2.Location = new Point(1256, 17);
            trackBar2.Name = "trackBar2";
            trackBar2.Size = new Size(130, 56);
            trackBar2.TabIndex = 11;
            trackBar2.TickStyle = TickStyle.None;
            // 
            // label20
            // 
            label20.AutoSize = true;
            label20.ForeColor = SystemColors.ButtonFace;
            label20.Location = new Point(1412, 93);
            label20.Name = "label20";
            label20.Size = new Size(39, 20);
            label20.TabIndex = 8;
            label20.Text = "--/--";
            // 
            // label19
            // 
            label19.AutoSize = true;
            label19.ForeColor = SystemColors.ButtonFace;
            label19.Location = new Point(640, 93);
            label19.Name = "label19";
            label19.Size = new Size(39, 20);
            label19.TabIndex = 7;
            label19.Text = "--/--";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Font = new Font("Elephant", 10.2F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label6.ForeColor = SystemColors.ButtonShadow;
            label6.Location = new Point(161, 80);
            label6.Name = "label6";
            label6.Size = new Size(107, 22);
            label6.TabIndex = 5;
            label6.Text = "Şarkıcı Adı";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Font = new Font("Elephant", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label5.ForeColor = SystemColors.ButtonFace;
            label5.Location = new Point(161, 41);
            label5.Name = "label5";
            label5.Size = new Size(107, 26);
            label5.TabIndex = 4;
            label5.Text = "Şarkı Adı";
            // 
            // pictureBox8
            // 
            pictureBox8.Image = (Image)resources.GetObject("pictureBox8.Image");
            pictureBox8.Location = new Point(40, 20);
            pictureBox8.Name = "pictureBox8";
            pictureBox8.Size = new Size(115, 115);
            pictureBox8.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox8.TabIndex = 3;
            pictureBox8.TabStop = false;
            // 
            // pictureBox3
            // 
            pictureBox3.Image = (Image)resources.GetObject("pictureBox3.Image");
            pictureBox3.Location = new Point(943, 10);
            pictureBox3.Name = "pictureBox3";
            pictureBox3.Size = new Size(55, 60);
            pictureBox3.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox3.TabIndex = 2;
            pictureBox3.TabStop = false;
            // 
            // pictureBox2
            // 
            pictureBox2.Image = (Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new Point(1116, 18);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new Size(42, 48);
            pictureBox2.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox2.TabIndex = 1;
            pictureBox2.TabStop = false;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(1013, 2);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(85, 85);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 0;
            pictureBox1.TabStop = false;
            pictureBox1.Click += pictureBox1_Click;
            // 
            // trackBar1
            // 
            trackBar1.Location = new Point(685, 72);
            trackBar1.Name = "trackBar1";
            trackBar1.Size = new Size(721, 56);
            trackBar1.TabIndex = 10;
            trackBar1.TickStyle = TickStyle.None;
            // 
            // panel13
            // 
            panel13.Location = new Point(1100, 64);
            panel13.Name = "panel13";
            panel13.Size = new Size(412, 800);
            panel13.TabIndex = 10;
            // 
            // panel7
            // 
            panel7.Controls.Add(panel8);
            panel7.Dock = DockStyle.Fill;
            panel7.Location = new Point(0, 0);
            panel7.Name = "panel7";
            panel7.Size = new Size(1902, 1033);
            panel7.TabIndex = 12;
            // 
            // panel8
            // 
            panel8.Controls.Add(panel9);
            panel8.Dock = DockStyle.Fill;
            panel8.Location = new Point(0, 0);
            panel8.Name = "panel8";
            panel8.Size = new Size(1902, 1033);
            panel8.TabIndex = 12;
            // 
            // panel9
            // 
            panel9.Controls.Add(panel10);
            panel9.Dock = DockStyle.Fill;
            panel9.Location = new Point(0, 0);
            panel9.Name = "panel9";
            panel9.Size = new Size(1902, 1033);
            panel9.TabIndex = 12;
            // 
            // panel10
            // 
            panel10.Controls.Add(panel12);
            panel10.Controls.Add(panel1);
            panel10.Dock = DockStyle.Fill;
            panel10.Location = new Point(0, 0);
            panel10.Name = "panel10";
            panel10.Size = new Size(1902, 1033);
            panel10.TabIndex = 12;
            // 
            // panel12
            // 
            panel12.BackColor = Color.FromArgb(50, 50, 50);
            panel12.CausesValidation = false;
            panel12.Controls.Add(panel4);
            panel12.Controls.Add(panel13);
            panel12.Dock = DockStyle.Fill;
            panel12.ForeColor = SystemColors.ControlLight;
            panel12.Location = new Point(397, 0);
            panel12.Name = "panel12";
            panel12.Size = new Size(1505, 1033);
            panel12.TabIndex = 1;
            // 
            // panel4
            // 
            panel4.Controls.Add(panel14);
            panel4.Location = new Point(0, 65);
            panel4.Name = "panel4";
            panel4.Size = new Size(1094, 800);
            panel4.TabIndex = 11;
            // 
            // panel14
            // 
            panel14.BackColor = Color.Transparent;
            panel14.Controls.Add(pictureBox21);
            panel14.Controls.Add(label8);
            panel14.Controls.Add(label7);
            panel14.Controls.Add(pictureBox9);
            panel14.Location = new Point(25, 22);
            panel14.Name = "panel14";
            panel14.Size = new Size(1066, 753);
            panel14.TabIndex = 17;
            // 
            // pictureBox21
            // 
            pictureBox21.Image = (Image)resources.GetObject("pictureBox21.Image");
            pictureBox21.Location = new Point(180, 253);
            pictureBox21.Name = "pictureBox21";
            pictureBox21.Size = new Size(70, 70);
            pictureBox21.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox21.TabIndex = 17;
            pictureBox21.TabStop = false;
            // 
            // label8
            // 
            label8.AutoSize = true;
            label8.Font = new Font("Elephant", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label8.ForeColor = SystemColors.ButtonShadow;
            label8.Location = new Point(20, 292);
            label8.Name = "label8";
            label8.Size = new Size(67, 20);
            label8.TabIndex = 2;
            label8.Text = "Sanatçı";
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Font = new Font("Elephant", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label7.ForeColor = SystemColors.ButtonFace;
            label7.Location = new Point(20, 262);
            label7.Name = "label7";
            label7.Size = new Size(76, 30);
            label7.TabIndex = 1;
            label7.Text = "Şarkı";
            // 
            // pictureBox9
            // 
            pictureBox9.Image = (Image)resources.GetObject("pictureBox9.Image");
            pictureBox9.Location = new Point(20, 17);
            pictureBox9.Name = "pictureBox9";
            pictureBox9.Size = new Size(230, 230);
            pictureBox9.TabIndex = 0;
            pictureBox9.TabStop = false;
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(26, 26, 26);
            panel1.Controls.Add(pictureBox4);
            panel1.Controls.Add(panel3);
            panel1.Controls.Add(label1);
            panel1.Dock = DockStyle.Left;
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(397, 1033);
            panel1.TabIndex = 0;
            // 
            // pictureBox4
            // 
            pictureBox4.BorderStyle = BorderStyle.FixedSingle;
            pictureBox4.Image = (Image)resources.GetObject("pictureBox4.Image");
            pictureBox4.Location = new Point(77, 87);
            pictureBox4.Name = "pictureBox4";
            pictureBox4.Size = new Size(230, 222);
            pictureBox4.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox4.TabIndex = 0;
            pictureBox4.TabStop = false;
            // 
            // panel3
            // 
            panel3.Controls.Add(label2);
            panel3.Controls.Add(pictureBox5);
            panel3.Location = new Point(3, 393);
            panel3.Name = "panel3";
            panel3.Size = new Size(380, 72);
            panel3.TabIndex = 2;
            panel3.Click += panel3_Click;
            panel3.Paint += panel3_Paint;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Elephant", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label2.ForeColor = SystemColors.ButtonFace;
            label2.Location = new Point(98, 21);
            label2.Name = "label2";
            label2.Size = new Size(159, 30);
            label2.TabIndex = 1;
            label2.Text = "Beğenilenler";
            label2.Click += label2_Click;
            // 
            // pictureBox5
            // 
            pictureBox5.Image = (Image)resources.GetObject("pictureBox5.Image");
            pictureBox5.Location = new Point(32, 11);
            pictureBox5.Name = "pictureBox5";
            pictureBox5.Size = new Size(55, 55);
            pictureBox5.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox5.TabIndex = 0;
            pictureBox5.TabStop = false;
            pictureBox5.Click += pictureBox5_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Elephant", 16.2F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label1.ForeColor = SystemColors.ButtonFace;
            label1.Location = new Point(114, 333);
            label1.Name = "label1";
            label1.Size = new Size(181, 37);
            label1.TabIndex = 1;
            label1.Text = "İsim giriniz";
            // 
            // contextMenuStrip1
            // 
            contextMenuStrip1.ImageScalingSize = new Size(20, 20);
            contextMenuStrip1.Name = "contextMenuStrip1";
            contextMenuStrip1.Size = new Size(61, 4);
            // 
            // pictureBox16
            // 
            pictureBox16.Image = (Image)resources.GetObject("pictureBox16.Image");
            pictureBox16.Location = new Point(35, 3);
            pictureBox16.Name = "pictureBox16";
            pictureBox16.Size = new Size(55, 55);
            pictureBox16.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox16.TabIndex = 2;
            pictureBox16.TabStop = false;
            pictureBox16.Click += pictureBox16_Click;
            // 
            // panel6
            // 
            panel6.BackColor = Color.FromArgb(26, 26, 26);
            panel6.Controls.Add(pictureBox27);
            panel6.Controls.Add(pictureBox16);
            panel6.Dock = DockStyle.Top;
            panel6.Location = new Point(0, 0);
            panel6.Name = "panel6";
            panel6.Size = new Size(1902, 63);
            panel6.TabIndex = 2;
            // 
            // pictureBox27
            // 
            pictureBox27.Image = (Image)resources.GetObject("pictureBox27.Image");
            pictureBox27.Location = new Point(100, 3);
            pictureBox27.Name = "pictureBox27";
            pictureBox27.Size = new Size(55, 55);
            pictureBox27.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox27.TabIndex = 4;
            pictureBox27.TabStop = false;
            pictureBox27.Click += pictureBox27_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(50, 50, 50);
            ClientSize = new Size(1902, 1033);
            Controls.Add(panel6);
            Controls.Add(panel2);
            Controls.Add(panel7);
            Name = "Form1";
            Text = "Form1";
            Load += Form1_Load;
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox18).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox17).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox15).EndInit();
            ((System.ComponentModel.ISupportInitialize)trackBar2).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox8).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox3).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ((System.ComponentModel.ISupportInitialize)trackBar1).EndInit();
            panel7.ResumeLayout(false);
            panel8.ResumeLayout(false);
            panel9.ResumeLayout(false);
            panel10.ResumeLayout(false);
            panel12.ResumeLayout(false);
            panel4.ResumeLayout(false);
            panel14.ResumeLayout(false);
            panel14.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox21).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox9).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox4).EndInit();
            panel3.ResumeLayout(false);
            panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox5).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).EndInit();
            panel6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox27).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private Panel panel2;
        private PictureBox pictureBox1;
        private PictureBox pictureBox2;
        private PictureBox pictureBox3;
        private Label label6;
        private Label label5;
        private PictureBox pictureBox8;
        private Label label20;
        private Label label19;
        private System.Windows.Forms.Timer timer1;
        private FlatTrackBar trackBar1;  // süre
        private FlatTrackBar trackBar2;  // ses
        private Panel panel7;
        private Panel panel8;
        private Panel panel9;
        private Panel panel10;
        private Panel panel1;
        private Panel panel3;
        private Label label2;
        private PictureBox pictureBox5;
        private Label label1;
        private PictureBox pictureBox4;
        protected internal Panel panel13;
        private Panel panel12;
        private ContextMenuStrip contextMenuStrip1;
        private PictureBox pictureBox15;
        private PictureBox pictureBox18;
        private PictureBox pictureBox17;
        private PictureBox pictureBox16;
        private Panel panel6;
        private PictureBox pictureBox27;
        private Panel panel4;
        private Panel panel14;
        private PictureBox pictureBox21;
        private Label label8;
        private Label label7;
        private PictureBox pictureBox9;
    }
}
