#nullable disable
using MySql.Data.MySqlClient;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace music
{
    public partial class MusicBar : UserControl
    {
        private readonly string baglantiKodu = "Server=localhost;Database=MuzikApp;Uid=root;Pwd=;";

        public int CurrentMuzikID { get; private set; }

        public MusicBar()
        {
            InitializeComponent();
        }

        // Form1 şarkı değiştirince bunu çağıracak
        public void UpdateInfo(int muzikId)
        {
            CurrentMuzikID = muzikId;
            LoadSongAndArtistInfo(muzikId);
        }

        private void LoadSongAndArtistInfo(int id)
        {
            // Varsayılanlar
            string sarkiAdi = "Bilinmiyor";
            string sanatciAdi = "Bilinmiyor";
            string sarkiSozuMetni = "Söz bulunamadı.";
            string biyografiMetni = "Bilgi yok.";

            string sanatciResimYolu = ""; // kullanicilar.userPhoto
            string kapakResimYolu = "";   // muzikler.pictures

            try
            {
                using (var baglanti = new MySqlConnection(baglantiKodu))
                {
                    baglanti.Open();

                    // ✅ Senin phpMyAdmin ekranlarına göre join:
                    // muzikler -> sanatcilar (SanatciID)
                    // sanatcilar -> kullanicilar (KullaniciID)  => userPhoto
                    string sql = @"
SELECT 
    m.SarkiAdi,
    m.SanatciAdi,
    m.SarkiSozleri,
    m.pictures      AS Kapak,
    sa.Biyografi    AS Biyografi,
    k.userPhoto     AS SanatciPhoto
FROM muzikler m
LEFT JOIN sanatcilar sa ON m.SanatciID = sa.SanatciID
LEFT JOIN kullanicilar k ON sa.KullaniciID = k.KullaniciID
WHERE m.MuzikID = @id
LIMIT 1;";

                    using (var cmd = new MySqlCommand(sql, baglanti))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        using (var oku = cmd.ExecuteReader())
                        {
                            if (oku.Read())
                            {
                                if (oku["SarkiAdi"] != DBNull.Value) sarkiAdi = oku["SarkiAdi"].ToString();
                                if (oku["SanatciAdi"] != DBNull.Value) sanatciAdi = oku["SanatciAdi"].ToString();
                                if (oku["SarkiSozleri"] != DBNull.Value) sarkiSozuMetni = oku["SarkiSozleri"].ToString();

                                if (oku["Biyografi"] != DBNull.Value) biyografiMetni = oku["Biyografi"].ToString();
                                if (oku["SanatciPhoto"] != DBNull.Value) sanatciResimYolu = oku["SanatciPhoto"].ToString();
                                if (oku["Kapak"] != DBNull.Value) kapakResimYolu = oku["Kapak"].ToString();
                            }
                        }
                    }
                }
            }
            catch
            {
                // istersen log koy
            }

            // ✅ UI thread güvenliği
            if (IsHandleCreated && InvokeRequired)
            {
                BeginInvoke(new Action(() =>
                    ApplyUi(sarkiAdi, sanatciAdi, sarkiSozuMetni, biyografiMetni, sanatciResimYolu, kapakResimYolu)));
            }
            else
            {
                ApplyUi(sarkiAdi, sanatciAdi, sarkiSozuMetni, biyografiMetni, sanatciResimYolu, kapakResimYolu);
            }
        }

        private void ApplyUi(
            string sarkiAdi,
            string sanatciAdi,
            string soz,
            string bio,
            string sanatciResimYolu,
            string kapakResimYolu)
        {
            // ⚠️ Kontrol isimleri sende neyse aynen:
            Sarki.Text = sarkiAdi;
            Sanatçı.Text = sanatciAdi;
            SarkiSozleri.Text = soz;
            sanatçı_hakkında_bilgi.Text = bio;

            // ✅ Foto yükle
// sanatçı foto
            LoadImageToPictureBox(sarkiPhoto, kapakResimYolu);     // kapak foto
        }

        private void LoadImageToPictureBox(PictureBox pb, string relativeOrFullPath)
        {
            try
            {
                if (pb == null) return;

                if (string.IsNullOrWhiteSpace(relativeOrFullPath))
                {
                    pb.Image = null;
                    pb.ImageLocation = null;
                    return;
                }

                string p = relativeOrFullPath.Trim();

                // ✅ Slashları Windows formatına çevir
                p = p.Replace("/", "\\");

                // ✅ "/pictures/1.jpg" veya "\pictures\1.jpg" gelirse relative say
                // (Path.IsPathRooted bu durumda bazen TRUE dönebiliyor)
                bool looksLikeWebRoot = p.StartsWith("\\") && !(p.Length >= 3 && char.IsLetter(p[1]) && p[2] == ':'); // "C:\"
                if (looksLikeWebRoot) p = p.TrimStart('\\');

                string fullPath;

                // ✅ Gerçek absolute ise aynen kullan (C:\... gibi)
                if (Path.IsPathRooted(p) && (p.Length >= 3 && char.IsLetter(p[0]) && p[1] == ':' && p[2] == '\\'))
                {
                    fullPath = p;
                }
                else
                {
                    // ✅ Relative ise StartupPath ile birleştir
                    fullPath = Path.Combine(Application.StartupPath, p.TrimStart('\\'));
                }

                if (File.Exists(fullPath))
                {
                    pb.ImageLocation = fullPath;
                    pb.SizeMode = PictureBoxSizeMode.StretchImage;
                }
                else
                {
                    pb.Image = null;
                    pb.ImageLocation = null;

                    // 🔎 Debug için aç (istersen kapatırsın)
                    // MessageBox.Show("Resim bulunamadı:\n" + fullPath);
                }
            }
            catch (Exception ex)
            {
                pb.Image = null;
                pb.ImageLocation = null;
                // MessageBox.Show("Resim yükleme hatası:\n" + ex.Message);
            }
        }


        private void Sanatçı_Click(object sender, EventArgs e)
        {
            // boş bırakılabilir
        }
    }
}

