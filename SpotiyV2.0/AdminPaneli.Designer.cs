namespace SpotiyV2._0
{
    partial class AdminPaneli
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AdminPaneli));
            panel6 = new Panel();
            pictureBox27 = new PictureBox();
            pictureBox16 = new PictureBox();
            pictureBox19 = new PictureBox();
            panel1 = new Panel();
            button2 = new Button();
            button1 = new Button();
            dataGridView1 = new DataGridView();
            KullanıcıID = new DataGridViewTextBoxColumn();
            KullanıcıAdı = new DataGridViewTextBoxColumn();
            Email = new DataGridViewTextBoxColumn();
            Rol = new DataGridViewTextBoxColumn();
            Durum = new DataGridViewTextBoxColumn();
            pictureBox1 = new PictureBox();
            textBox1 = new TextBox();
            panel6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox27).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox19).BeginInit();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
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
            panel6.TabIndex = 11;
            panel6.Paint += panel6_Paint;
            // 
            // pictureBox27
            // 
            pictureBox27.Image = (Image)resources.GetObject("pictureBox27.Image");
            pictureBox27.Location = new Point(134, 5);
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
            pictureBox16.Location = new Point(73, 5);
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
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(30, 30, 30);
            panel1.Controls.Add(button2);
            panel1.Controls.Add(button1);
            panel1.Controls.Add(dataGridView1);
            panel1.Controls.Add(pictureBox1);
            panel1.Controls.Add(textBox1);
            panel1.Location = new Point(554, 87);
            panel1.Name = "panel1";
            panel1.Size = new Size(800, 910);
            panel1.TabIndex = 13;
            // 
            // button2
            // 
            button2.Font = new Font("Elephant", 11.999999F);
            button2.Location = new Point(466, 817);
            button2.Name = "button2";
            button2.Size = new Size(147, 70);
            button2.TabIndex = 17;
            button2.Text = "Banı Kaldır";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click_1;
            // 
            // button1
            // 
            button1.Font = new Font("Elephant", 11.999999F);
            button1.Location = new Point(634, 817);
            button1.Name = "button1";
            button1.Size = new Size(147, 70);
            button1.TabIndex = 16;
            button1.Text = "Banla";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click_1;
            // 
            // dataGridView1
            // 
            dataGridView1.BackgroundColor = Color.FromArgb(42, 42, 42);
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { KullanıcıID, KullanıcıAdı, Email, Rol, Durum });
            dataGridView1.Location = new Point(19, 82);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 51;
            dataGridView1.Size = new Size(762, 692);
            dataGridView1.TabIndex = 15;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            // 
            // KullanıcıID
            // 
            KullanıcıID.HeaderText = "Kullanıcı ID";
            KullanıcıID.MinimumWidth = 6;
            KullanıcıID.Name = "KullanıcıID";
            KullanıcıID.Width = 125;
            // 
            // KullanıcıAdı
            // 
            KullanıcıAdı.HeaderText = "Kullanıcı Adı";
            KullanıcıAdı.MinimumWidth = 6;
            KullanıcıAdı.Name = "KullanıcıAdı";
            KullanıcıAdı.Width = 125;
            // 
            // Email
            // 
            Email.HeaderText = "E-Mail";
            Email.MinimumWidth = 6;
            Email.Name = "Email";
            Email.Width = 208;
            // 
            // Rol
            // 
            Rol.HeaderText = "Rol";
            Rol.MinimumWidth = 6;
            Rol.Name = "Rol";
            Rol.Width = 125;
            // 
            // Durum
            // 
            Durum.HeaderText = "Durum";
            Durum.MinimumWidth = 6;
            Durum.Name = "Durum";
            Durum.Width = 125;
            // 
            // pictureBox1
            // 
            pictureBox1.BackColor = Color.FromArgb(42, 42, 42);
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(745, 17);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(30, 30);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 11;
            pictureBox1.TabStop = false;
            // 
            // textBox1
            // 
            textBox1.BackColor = Color.FromArgb(42, 42, 42);
            textBox1.BorderStyle = BorderStyle.None;
            textBox1.Font = new Font("Elephant", 11.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            textBox1.ForeColor = SystemColors.ButtonFace;
            textBox1.Location = new Point(19, 14);
            textBox1.Multiline = true;
            textBox1.Name = "textBox1";
            textBox1.PlaceholderText = "Kullanıcı Ara";
            textBox1.Size = new Size(762, 35);
            textBox1.TabIndex = 14;
            // 
            // AdminPaneli
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(50, 50, 50);
            ClientSize = new Size(1902, 1033);
            Controls.Add(panel1);
            Controls.Add(panel6);
            Name = "AdminPaneli";
            Text = "AdminPaneli";
            panel6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox27).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox16).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox19).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel6;
        private PictureBox pictureBox27;
        private PictureBox pictureBox16;
        private PictureBox pictureBox19;
        private Panel panel1;
        private TextBox textBox1;
        private PictureBox pictureBox1;
        private DataGridView dataGridView1;
        private Button button2;
        private Button button1;
        private DataGridViewTextBoxColumn KullanıcıID;
        private DataGridViewTextBoxColumn KullanıcıAdı;
        private DataGridViewTextBoxColumn Email;
        private DataGridViewTextBoxColumn Rol;
        private DataGridViewTextBoxColumn Durum;
    }
}