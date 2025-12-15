using System;
using System.Drawing;
using System.Windows.Forms;

namespace LoginSginupResetPassword
{
    partial class Account
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Account));
            pictureBox1 = new PictureBox();
            panel1 = new Panel();
            pictureBox2 = new PictureBox();
            label3 = new Label();
            textBox3 = new TextBox();
            textBox1 = new TextBox();
            label1 = new Label();
            button2 = new Button();
            button1 = new Button();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            SuspendLayout();
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(215, 302);
            pictureBox1.Margin = new Padding(6, 4, 6, 4);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(450, 450);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 10;
            pictureBox1.TabStop = false;
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(26, 26, 26);
            panel1.Controls.Add(pictureBox2);
            panel1.Controls.Add(label3);
            panel1.Controls.Add(textBox3);
            panel1.Controls.Add(textBox1);
            panel1.Controls.Add(label1);
            panel1.Controls.Add(button2);
            panel1.Controls.Add(button1);
            panel1.Location = new Point(860, 302);
            panel1.Name = "panel1";
            panel1.Size = new Size(896, 450);
            panel1.TabIndex = 13;
            // 
            // pictureBox2
            // 
            pictureBox2.BackColor = SystemColors.Window;
            pictureBox2.Image = SpotiyV2._0.Properties.Resources.GozKapali;
            pictureBox2.Location = new Point(828, 192);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new Size(33, 33);
            pictureBox2.SizeMode = PictureBoxSizeMode.Zoom;
            pictureBox2.TabIndex = 19;
            pictureBox2.TabStop = false;
            pictureBox2.Click += pictureBox2_Click;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Elephant", 13.8F);
            label3.ForeColor = Color.FromArgb(255, 200, 0);
            label3.Location = new Point(29, 197);
            label3.Margin = new Padding(6, 0, 6, 0);
            label3.Name = "label3";
            label3.Size = new Size(125, 30);
            label3.TabIndex = 18;
            label3.Text = "Password";
            // 
            // textBox3
            // 
            textBox3.Font = new Font("Elephant", 13.8F);
            textBox3.Location = new Point(336, 190);
            textBox3.Margin = new Padding(6, 4, 6, 4);
            textBox3.Name = "textBox3";
            textBox3.Size = new Size(528, 37);
            textBox3.TabIndex = 17;
            textBox3.UseSystemPasswordChar = true;
            // 
            // textBox1
            // 
            textBox1.Font = new Font("Elephant", 13.8F);
            textBox1.Location = new Point(336, 70);
            textBox1.Margin = new Padding(6, 4, 6, 4);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(528, 37);
            textBox1.TabIndex = 16;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Elephant", 13.8F);
            label1.ForeColor = Color.FromArgb(255, 200, 0);
            label1.Location = new Point(29, 77);
            label1.Margin = new Padding(6, 0, 6, 0);
            label1.Name = "label1";
            label1.Size = new Size(130, 30);
            label1.TabIndex = 15;
            label1.Text = "Username";
            // 
            // button2
            // 
            button2.BackColor = Color.FromArgb(255, 200, 0);
            button2.FlatStyle = FlatStyle.Popup;
            button2.Font = new Font("Elephant", 22.1999989F);
            button2.Location = new Point(648, 301);
            button2.Margin = new Padding(6, 4, 6, 4);
            button2.Name = "button2";
            button2.Size = new Size(220, 78);
            button2.TabIndex = 14;
            button2.Text = "Log In";
            button2.UseVisualStyleBackColor = false;
            button2.Click += button2_Click;
            // 
            // button1
            // 
            button1.BackColor = Color.FromArgb(255, 200, 0);
            button1.FlatStyle = FlatStyle.Popup;
            button1.Font = new Font("Elephant", 22.1999989F);
            button1.Location = new Point(336, 301);
            button1.Margin = new Padding(6, 4, 6, 4);
            button1.Name = "button1";
            button1.Size = new Size(229, 78);
            button1.TabIndex = 13;
            button1.Text = "Sign Up";
            button1.UseVisualStyleBackColor = false;
            // 
            // Account
            // 
            AutoScaleDimensions = new SizeF(16F, 30F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(50, 50, 50);
            ClientSize = new Size(1902, 1033);
            Controls.Add(panel1);
            Controls.Add(pictureBox1);
            Font = new Font("Elephant", 13.8F);
            Margin = new Padding(6, 4, 6, 4);
            Name = "Account";
            Text = "Login System";
            Load += Account_Load;
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private PictureBox pictureBox1;
        private Panel panel1;
        private PictureBox pictureBox2;
        private Label label3;
        private TextBox textBox3;
        private TextBox textBox1;
        private Label label1;
        private Button button2;
        private Button button1;
    }
}
