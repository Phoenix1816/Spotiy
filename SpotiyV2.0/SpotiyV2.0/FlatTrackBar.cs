using System;
using System.Drawing;
using System.Windows.Forms;
using System.Drawing.Drawing2D;

namespace SpotiyV2._0
{
    public class FlatTrackBar : TrackBar
    {
        // Bar’ın kalınlığı ve topuzun boyu
        private int barHeight = 6;     // çizgi kalınlığı
        private int thumbDiameter = 14; // topuz çapı

        private bool _dragging = false;

        public FlatTrackBar()
        {
            SetStyle(ControlStyles.AllPaintingInWmPaint |
                     ControlStyles.UserPaint |
                     ControlStyles.OptimizedDoubleBuffer, true);

            TickStyle = TickStyle.None;
            Height = 30; // Kontrolün toplam yüksekliği (Designer’dan da büyütebilirsin)
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias;

            // Arka planı temizle
            Color back = Parent?.BackColor ?? BackColor;
            e.Graphics.Clear(back);

            // ───── ÇİZGİ (TRACK) ─────
            int trackY = Height / 2 - barHeight / 2;
            Rectangle trackRect = new Rectangle(0, trackY, Width, barHeight);

            using (var trackBrush = new SolidBrush(Color.FromArgb(200, 200, 200)))
            {
                e.Graphics.FillRectangle(trackBrush, trackRect);
            }

            if (Maximum <= Minimum)
                return;

            // ───── TOPUZ (THUMB) ─────
            int radius = thumbDiameter;
            int minX = radius / 2;
            int maxX = Width - radius / 2;

            float percent = (float)(Value - Minimum) / (Maximum - Minimum);
            int centerX = minX + (int)(percent * (maxX - minX));

            Rectangle thumbRect = new Rectangle(
                centerX - radius / 2,
                Height / 2 - radius / 2,
                radius,
                radius);

            using (var thumbBrush = new SolidBrush(Color.FromArgb(255, 200, 0))) // 255;200;0
            {
                e.Graphics.FillEllipse(thumbBrush, thumbRect);
            }
        }

        // Mouse ile daha rahat tutmak için: bara nereye tıklarsan tıkla değeri oraya çeksin
        private void SetValueFromMouseX(int x)
        {
            int radius = thumbDiameter;
            int minX = radius / 2;
            int maxX = Width - radius / 2;

            if (x < minX) x = minX;
            if (x > maxX) x = maxX;

            float percent = (float)(x - minX) / (maxX - minX);
            int newVal = Minimum + (int)Math.Round(percent * (Maximum - Minimum));

            if (newVal < Minimum) newVal = Minimum;
            if (newVal > Maximum) newVal = Maximum;

            Value = newVal;
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                _dragging = true;
                SetValueFromMouseX(e.X);  // ilk tıklamada da oraya zıplasın
            }
            base.OnMouseDown(e);
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (_dragging && e.Button == MouseButtons.Left)
            {
                SetValueFromMouseX(e.X);
            }
            base.OnMouseMove(e);
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            _dragging = false;
            base.OnMouseUp(e);
        }

        protected override void OnValueChanged(EventArgs e)
        {
            base.OnValueChanged(e);
            Invalidate();   // her değer değişiminde komple yeniden çiz
        }

        protected override void OnScroll(EventArgs e)
        {
            base.OnScroll(e);
            Invalidate();
        }
    }
}
