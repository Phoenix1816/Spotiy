-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Ara 2025, 12:35:07
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `muzikapp`
--
CREATE DATABASE IF NOT EXISTS `muzikapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `muzikapp`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `KullaniciID` int(11) NOT NULL,
  `AdSoyad` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Sifre` varchar(255) DEFAULT NULL,
  `Rol` int(50) NOT NULL,
  `Durum` int(11) NOT NULL,
  `userPhoto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`KullaniciID`, `AdSoyad`, `Email`, `Sifre`, `Rol`, `Durum`, `userPhoto`) VALUES
(16, 'Çağrı', 'cagri@gmail.com', '123456', 1, 1, '0'),
(17, 'Wegh', 'rumi@gmail.com', 'Rumi', 2, 1, '/pictures/user_17_20251215_094054.png'),
(18, 'NursenaYener', 'nursenayener@gmail.com', '123456', 2, 1, '/pictures/user_18_20251215_094326.png'),
(19, 'dedubluman', 'dedubluman@gmail.com', 'dedubluman', 2, 1, '/pictures/user_19_20251215_102439.png'),
(20, 'Sertab Erener', 'sertab@mail.com', '123', 2, 1, '/pictures/user_20_20251215_103647.png'),
(21, 'Anonim', 'Anonim@mail.com', '123', 2, 1, '0'),
(22, 'Semincek', 'semincek@outlook.com', '654321', 2, 1, '/pictures/user_22_20251215_114705.png'),
(23, 'Model', 'model@mial.com', 'değmesinellerimiz', 2, 1, '/pictures/user_23_20251215_115143.png'),
(24, 'yirmi7', 'yirmi7@gmial.com', '27', 2, 1, '/pictures/user_24_20251215_115838.png'),
(25, 'Uzi', 'elchavo@mail.co', '134679', 2, 1, '/pictures/user_25_20251215_120212.png'),
(26, 'Motive', 'moti@mail.coo', '1937', 2, 1, '/pictures/user_26_20251215_120423.png'),
(27, 'irem eylul yuksle', 'iey04@gmail.com', 'iey55', 0, 1, '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `listeler`
--

CREATE TABLE `listeler` (
  `ListeID` int(11) NOT NULL,
  `KullaniciID` int(11) DEFAULT NULL,
  `Ad` varchar(100) DEFAULT NULL,
  `Gorunurluk` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `listeler`
--

INSERT INTO `listeler` (`ListeID`, `KullaniciID`, `Ad`, `Gorunurluk`) VALUES
(9, 17, 'Favoriler', 1),
(10, 16, 'Favoriler', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `muzikler`
--

CREATE TABLE `muzikler` (
  `MuzikID` int(11) NOT NULL,
  `SanatciID` int(11) DEFAULT NULL,
  `SanatciAdi` varchar(50) NOT NULL,
  `SarkiAdi` varchar(100) DEFAULT NULL,
  `SarkiSozleri` varchar(1250) NOT NULL,
  `Uzunluk` varchar(10) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `UrlToken` varchar(255) DEFAULT NULL,
  `pictures` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `muzikler`
--

INSERT INTO `muzikler` (`MuzikID`, `SanatciID`, `SanatciAdi`, `SarkiAdi`, `SarkiSozleri`, `Uzunluk`, `Tarih`, `UrlToken`, `pictures`) VALUES
(40, 1, 'Wegh', '16-24', '', '', '2025-12-15', '/music/wegh_16-24.mp3', '/pictures/wegh_16-24_cover.png'),
(41, 1, 'Wegh', 'Bu Ben Olmamak', '', '', '2025-12-15', '/music/wegh_bu_ben_olmamak.mp3', '/pictures/wegh_bu_ben_olmamak_cover.png'),
(42, 1, 'Wegh', 'Çok İnsan Affettim', '', '', '2025-12-15', '/music/wegh_cok_İnsan_affettim.mp3', '/pictures/wegh_cok_İnsan_affettim_cover.png'),
(43, 1, 'Wegh', 'Çöp Şiş', '', '', '2025-12-15', '/music/wegh_cop_sis.mp3', '/pictures/wegh_cop_sis_cover.png'),
(44, 1, 'Wegh', 'Geri Ver', '', '', '2025-12-15', '/music/wegh_geri_ver.mp3', '/pictures/wegh_geri_ver_cover.png'),
(45, 1, 'Wegh', 'Güldüğün Gün', '', '', '2025-12-15', '/music/wegh_guldugun_gun.mp3', '/pictures/wegh_guldugun_gun_cover.png'),
(46, 1, 'Wegh', 'Halit Abi', '', '', '2025-12-15', '/music/wegh_halit_abi.mp3', '/pictures/wegh_halit_abi_cover.png'),
(47, 1, 'Wegh', 'Karardı Bulutlar', '', '', '2025-12-15', '/music/wegh_karardi_bulutlar.mp3', '/pictures/wegh_karardi_bulutlar_cover.png'),
(48, 1, 'Wegh', 'Kennedy\'i Ben Vurdum', '', '', '2025-12-15', '/music/wegh_kennedy\'i_ben_vurdum.mp3', '/pictures/wegh_kennedy\'i_ben_vurdum_cover.png'),
(49, 1, 'Wegh', 'Kin', '', '', '2025-12-15', '/music/wegh_kin.mp3', '/pictures/wegh_kin_cover.png'),
(50, 1, 'Wegh', 'Kum Saati', '', '', '2025-12-15', '/music/wegh_kum_saati.mp3', '/pictures/wegh_kum_saati_cover.png'),
(51, 1, 'Wegh', 'Murabba', '', '', '2025-12-15', '/music/wegh_murabba.mp3', '/pictures/wegh_murabba_cover.png'),
(52, 1, 'Wegh', 'Rumi Madafaka', '', '', '2025-12-15', '/music/wegh_rumi_madafaka.mp3', '/pictures/wegh_rumi_madafaka_cover.png'),
(53, 1, 'Wegh', 'Sana Vuruldum', '', '', '2025-12-15', '/music/wegh_sana_vuruldum.mp3', '/pictures/wegh_sana_vuruldum_cover.png'),
(54, 1, 'Wegh', 'Yağsın Dünya Üstüme', '', '', '2025-12-15', '/music/wegh_yagsin_dunya_ustume.mp3', '/pictures/wegh_yagsin_dunya_ustume_cover.png'),
(55, 1, 'Wegh', 'Yanlışlarla Karşılaştım', '', '', '2025-12-15', '/music/wegh_yanlislarla_karsilastim.mp3', '/pictures/wegh_yanlislarla_karsilastim_cover.png'),
(56, 2, 'NursenaYener', 'Ah Bu Şarkıların Gözü Kör Olsun', '', '', '2025-12-15', '/music/nursenayener_ah_bu_sarkilarin_gozu_kor_olsun.mp3', '/pictures/nursenayener_ah_bu_sarkilarin_gozu_kor_o'),
(57, 2, 'NursenaYener', 'Aşkın Yalanmış', '', '', '2025-12-15', '/music/nursenayener_askin_yalanmis.mp3', '/pictures/nursenayener_askin_yalanmis_cover.png'),
(58, 2, 'NursenaYener', 'Bir Tek Düşüncem Sensin', '', '', '2025-12-15', '/music/nursenayener_bir_tek_dusuncem_sensin.mp3', '/pictures/nursenayener_bir_tek_dusuncem_sensin_cov'),
(59, 2, 'NursenaYener', 'Galata', '', '', '2025-12-15', '/music/nursenayener_galata.mp3', '/pictures/nursenayener_galata_cover.png'),
(60, 2, 'NursenaYener', 'Kendime Yalan Söyledim', '', '', '2025-12-15', '/music/nursenayener_kendime_yalan_soyledim.mp3', '/pictures/nursenayener_kendime_yalan_soyledim_cove'),
(61, 2, 'NursenaYener', 'Seni Severdim', '', '', '2025-12-15', '/music/nursenayener_seni_severdim.mp3', '/pictures/nursenayener_seni_severdim_cover.png'),
(62, 2, 'NursenaYener', 'Unuttun mu Beni', '', '', '2025-12-15', '/music/nursenayener_unuttun_mu_beni.mp3', '/pictures/nursenayener_unuttun_mu_beni_cover.png'),
(63, 2, 'NursenaYener', 'Vaçgeçtim', '', '', '2025-12-15', '/music/nursenayener_vacgectim.mp3', '/pictures/nursenayener_vacgectim_cover.png'),
(64, 3, 'dedubluman', 'Belki', '', '', '2025-12-15', '/music/dedubluman_belki.mp3', '/pictures/dedubluman_belki_cover.png'),
(65, 3, 'dedubluman', 'Bir İhtimal Halim', '', '', '2025-12-15', '/music/dedubluman_bir_İhtimal_halim.mp3', '/pictures/dedubluman_bir_İhtimal_halim_cover.png'),
(66, 3, 'dedubluman', 'Bunca Yıl', '', '', '2025-12-15', '/music/dedubluman_bunca_yil.mp3', '/pictures/dedubluman_bunca_yil_cover.png'),
(67, 3, 'dedubluman', 'Çözemezsin', '', '', '2025-12-15', '/music/dedubluman_cozemezsin.mp3', '/pictures/dedubluman_cozemezsin_cover.png'),
(68, 3, 'dedubluman', 'Dağılma (Ben De Özledim)', '', '', '2025-12-15', '/music/dedubluman_dagilma_(ben_de_ozledim).mp3', '/pictures/dedubluman_dagilma_(ben_de_ozledim)_cove'),
(69, 3, 'dedubluman', 'Düğün', '', '', '2025-12-15', '/music/dedubluman_dugun.mp3', '/pictures/dedubluman_dugun_cover.png'),
(70, 3, 'dedubluman', 'Fikrimin İnce Gülü', '', '', '2025-12-15', '/music/dedubluman_fikrimin_İnce_gulu.mp3', '/pictures/dedubluman_fikrimin_İnce_gulu_cover.png'),
(71, 3, 'dedubluman', 'Gamzedeyim Deva Bulmam', '', '', '2025-12-15', '/music/dedubluman_gamzedeyim_deva_bulmam.mp3', '/pictures/dedubluman_gamzedeyim_deva_bulmam_cover.'),
(72, 3, 'dedubluman', 'Günü Gelir', '', '', '2025-12-15', '/music/dedubluman_gunu_gelir.mp3', '/pictures/dedubluman_gunu_gelir_cover.png'),
(73, 3, 'dedubluman', 'Karar Verdim', '', '', '2025-12-15', '/music/dedubluman_karar_verdim.mp3', '/pictures/dedubluman_karar_verdim_cover.png'),
(74, 3, 'dedubluman', 'Kimseye Etmem Şikayet', '', '', '2025-12-15', '/music/dedubluman_kimseye_etmem_sikayet.mp3', '/pictures/dedubluman_kimseye_etmem_sikayet_cover.p'),
(75, 3, 'dedubluman', 'Sakladğığn Bir Şeyler Var', '', '', '2025-12-15', '/music/dedubluman_sakladgign_bir_seyler_var.mp3', '/pictures/dedubluman_sakladgign_bir_seyler_var_cov'),
(76, 3, 'dedubluman', 'Sana Güvenmiyorum', '', '', '2025-12-15', '/music/dedubluman_sana_guvenmiyorum.mp3', '/pictures/dedubluman_sana_guvenmiyorum_cover.png'),
(77, 4, 'Sertab Erener', 'Alaturka', '', '', '2025-12-15', '/music/sertab_erener_alaturka.mp3', '/pictures/sertab_erener_alaturka_cover.png'),
(78, 5, 'Anonim', 'Ali Dayı', '', '', '2025-12-15', '/music/anonim_ali_dayi.mp3', '/pictures/anonim_ali_dayi_cover.png'),
(79, 5, 'Anonim', 'Bahçe Duvarından Aştım', '', '', '2025-12-15', '/music/anonim_bahce_duvarindan_astim.mp3', '/pictures/anonim_bahce_duvarindan_astim_cover.png'),
(80, 5, 'Anonim', 'Dede', '', '', '2025-12-15', '/music/anonim_dede.mp3', '/pictures/anonim_dede_cover.png'),
(81, 5, 'Anonim', 'Delalım', '', '', '2025-12-15', '/music/anonim_delalim.mp3', '/pictures/anonim_delalim_cover.png'),
(82, 5, 'Anonim', 'Erik Dalı', '', '', '2025-12-15', '/music/anonim_erik_dali.mp3', '/pictures/anonim_erik_dali_cover.png'),
(83, 5, 'Anonim', 'Korkak', '', '', '2025-12-15', '/music/anonim_korkak.mp3', '/pictures/anonim_korkak_cover.png'),
(84, 5, 'Anonim', 'Para Bizde', '', '', '2025-12-15', '/music/anonim_para_bizde.mp3', '/pictures/anonim_para_bizde_cover.png'),
(85, 5, 'Anonim', 'Xantini Tabancası', '', '', '2025-12-15', '/music/anonim_xantini_tabancasi.mp3', '/pictures/anonim_xantini_tabancasi_cover.png'),
(86, 5, 'Anonim', 'Ya Ben Anlatamadum', '', '', '2025-12-15', '/music/anonim_ya_ben_anlatamadum.mp3', '/pictures/anonim_ya_ben_anlatamadum_cover.png'),
(87, 6, 'Semincek', 'Çıkmaz Bir Sokakta', '', '', '2025-12-15', '/music/semincek_cikmaz_bir_sokakta.mp3', '/pictures/semincek_cikmaz_bir_sokakta_cover.png'),
(88, 7, 'Model', 'Bir Pazar Kahvaltısı', '', '', '2025-12-15', '/music/model_bir_pazar_kahvaltisi.mp3', '/pictures/model_bir_pazar_kahvaltisi_cover.png'),
(89, 7, 'Model', 'Değmesin Ellerimiz', '', '', '2025-12-15', '/music/model_degmesin_ellerimiz.mp3', '/pictures/model_degmesin_ellerimiz_cover.png'),
(90, 7, 'Model', 'Mey', '', '', '2025-12-15', '/music/model_mey.mp3', '/pictures/model_mey_cover.png'),
(91, 8, 'yirmi7', 'Muhtemel Aşk', '', '', '2025-12-15', '/music/yirmi7_muhtemel_ask.mp3', '/pictures/yirmi7_muhtemel_ask_cover.png'),
(92, 9, 'Uzi', 'Şarkılar Sokaklara Ait', '', '', '2025-12-15', '/music/uzi_sarkilar_sokaklara_ait.mp3', '/pictures/uzi_sarkilar_sokaklara_ait_cover.png'),
(93, 10, 'Motive', 'Şarkılar Sokaklara Ait', '', '', '2025-12-15', '/music/motive_sarkilar_sokaklara_ait.mp3', '/pictures/motive_sarkilar_sokaklara_ait_cover.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odemeler`
--

CREATE TABLE `odemeler` (
  `OdemeID` int(11) NOT NULL,
  `KullaniciID` int(11) DEFAULT NULL,
  `UyelikID` int(11) DEFAULT NULL,
  `OdemeTarihi` datetime DEFAULT current_timestamp(),
  `Tutar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `playlistmuzik`
--

CREATE TABLE `playlistmuzik` (
  `ListeID` int(11) NOT NULL,
  `KullaniciID` int(11) NOT NULL,
  `MuzikID` int(11) NOT NULL,
  `SiraNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `playlistmuzik`
--

INSERT INTO `playlistmuzik` (`ListeID`, `KullaniciID`, `MuzikID`, `SiraNo`) VALUES
(10, 16, 40, 1),
(10, 16, 93, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `premium`
--

CREATE TABLE `premium` (
  `UyelikID` int(11) NOT NULL,
  `KullaniciID` int(11) DEFAULT NULL,
  `BaslangicTarihi` date DEFAULT NULL,
  `BitisTarihi` date DEFAULT NULL,
  `Durum` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sanatcilar`
--

CREATE TABLE `sanatcilar` (
  `SanatciID` int(11) NOT NULL,
  `KullaniciID` int(11) DEFAULT NULL,
  `OnayDurumu` varchar(20) DEFAULT NULL,
  `SarkiSayisi` int(11) DEFAULT 0,
  `Biyografi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `sanatcilar`
--

INSERT INTO `sanatcilar` (`SanatciID`, `KullaniciID`, `OnayDurumu`, `SarkiSayisi`, `Biyografi`) VALUES
(1, 17, '1', 16, 'Wegh, sahne adıyla Wegh-Rumi, Türk alternatif müzik sahnesinde öne çıkan genç bir şarkıcı ve söz yazarıdır. Müziklerinde modern altyapıları, melankolik melodileri ve derin sözlerle birleştirerek kendine özgü bir tarz oluşturmuştur. Şarkılarında çoğunlukla aşk, içsel çatışmalar, yalnızlık ve hayatın anlamı gibi temalara yer verir. Dijital platformlarda yayımladığı parçalarla kısa sürede geniş bir dinleyici kitlesine ulaşmıştır. Wegh-Rumi, bağımsız müzik anlayışı ve özgün duruşuyla yeni nesil Türk müzisyenler arasında dikkat çeken isimlerden biridir.'),
(2, 18, '1', 8, 'Nursena Yener, Türk alternatif müzik sahnesinde özgün yorumu ve duygusal anlatımıyla dikkat çeken genç bir şarkıcı ve söz yazarıdır. Müzik kariyerinde sade ama etkileyici melodileri, içten sözlerle birleştirerek samimi bir atmosfer yaratır. Şarkılarında çoğunlukla aşk, kırılganlık, yalnızlık ve kişisel dönüşüm temalarını işler. Dijital müzik platformlarında yayımladığı eserlerle kısa sürede dinleyici kitlesini genişletmiştir. Bağımsız müzik üretimine önem veren Nursena Yener, kendine has tarzı ve güçlü duygusal bağ kuran şarkılarıyla yeni nesil Türk müzisyenler arasında öne çıkmaktadır.'),
(3, 19, '1', 13, 'Dedublüman, 2010’lu yılların sonlarında çıkış yapan ve Türk alternatif rock sahnesinde kısa sürede geniş bir dinleyici kitlesine ulaşan müzik grubudur. Grup, duygusal yoğunluğu yüksek sözleri ve melankolik melodileriyle tanınır. Şarkılarında insan ilişkileri, içsel çatışmalar, yalnızlık ve hayatın gerçekleri gibi temaları işler. Özellikle “Belki” ve “Gamzedeyim Deva Bulmam” yorumlarıyla büyük ilgi görmüştür. Dedublüman, sade ama etkileyici müzik anlayışı ve samimi duruşuyla modern Türk rock müziğinin dikkat çeken temsilcilerinden biridir.'),
(4, 20, '1', 1, 'Sertab Erener, Türk pop müziğinin en güçlü ve etkili kadın sanatçılarından biridir. 1964 yılında İstanbul’da doğmuştur. Müzik kariyerine Sezen Aksu ile çalışarak başlamış, kısa sürede kendine özgü vokali ve sahne duruşuyla dikkat çekmiştir. Pop, rock ve elektronik müziği harmanlayan tarzıyla geniş bir dinleyici kitlesine ulaşmıştır. 2003 yılında “Everyway That I Can” adlı şarkıyla Eurovision Şarkı Yarışması’nı kazanarak Türkiye’ye büyük bir başarı kazandırmıştır. Sertab Erener, uzun soluklu kariyeri boyunca çok sayıda albüm ve ödüle imza atmıştır.'),
(5, 21, NULL, 9, NULL),
(6, 22, '1', 1, 'Semicenk, Türk pop ve alternatif müzik sahnesinde son yıllarda hızlı bir yükseliş yakalayan şarkıcı ve söz yazarıdır. Duygusal yoğunluğu yüksek şarkıları, sade ama etkileyici melodileriyle geniş bir dinleyici kitlesine ulaşmıştır. Özellikle aşk, ayrılık ve içsel kırılmalar üzerine yazdığı sözlerle tanınır. Dijital platformlarda yayımladığı parçalar kısa sürede milyonlarca dinlenmeye ulaşarak büyük ilgi görmüştür. Samimi vokali ve modern müzik anlayışıyla dikkat çeken Semicenk, yeni nesil Türk müzisyenleri arasında önemli bir yer edinmiştir.'),
(7, 23, '1', 3, 'Model, 2005 yılında İstanbul’da kurulan ve Türk alternatif rock sahnesinde önemli bir yer edinen müzik grubudur. Güçlü kadın vokali, akılda kalıcı melodileri ve duygusal sözleriyle tanınır. Şarkılarında aşk, hayal kırıklığı, yalnızlık ve toplumsal duygulara sıkça yer verir. “Pembe Mezarlık”, “Değmesin Ellerimiz” ve “Antidepresan Gülümsemesi” gibi parçalarıyla geniş kitlelere ulaşmıştır. Sahne performansları ve samimi anlatımıyla dikkat çeken Model, Türk rock müziğinin en sevilen gruplarından biri olarak anılmaktadır.'),
(8, 24, '1', 1, 'Yirmi7, 2006 yılında kurulan ve Türk pop rock müzik sahnesinde kendine özgü tarzıyla dikkat çeken bir müzik grubudur. Enerjik melodileri, duygusal sözleri ve akılda kalıcı nakaratlarıyla geniş bir dinleyici kitlesine ulaşmıştır. Şarkılarında aşk, hayal kırıklıkları, umut ve günlük yaşamın duygusal yönlerini işler. “Muhtemel Aşk”, “Uçurum” ve “Her Şey Bitti” gibi parçalarıyla tanınan grup, özellikle genç dinleyiciler arasında popüler olmuştur. Yirmi7, sahnedeki samimi performansı ve modern pop rock anlayışıyla Türk müziğinde kendine sağlam bir yer edinmiştir.'),
(9, 25, NULL, 1, 'Uzi, Türk rap ve trap müzik sahnesinin en popüler ve etkili isimlerinden biridir. Asıl adı Utku Yalçınkaya olan sanatçı, sert sözleri, karanlık atmosferi ve modern trap altyapılarıyla tanınır. Müziklerinde sokak kültürü, başarı, mücadele ve kişisel deneyimlere sıkça yer verir. “Krvn”, “Makina” ve “Paparazzi” gibi şarkılarıyla dijital platformlarda milyonlarca dinlenmeye ulaşmıştır. Kendine özgü tarzı, agresif vokali ve görsel dünyasıyla yeni nesil Türk rap müziğinin öne çıkan figürlerinden biri olarak kabul edilmektedir.'),
(10, 26, '1', 1, 'Motive, Türk rap müziğinin genç ve üretken isimlerinden biridir. Gerçek adı Tolga Can Serbes olan sanatçı, teknik rap yeteneği, hızlı flow’u ve güçlü kelime oyunlarıyla tanınır. Kariyerine underground rap sahnesinde başlamış, kısa sürede kendine sadık bir dinleyici kitlesi oluşturmuştur. Şarkılarında kişisel mücadeleler, hırs, başarı arzusu ve içsel çatışmalar gibi temalara yer verir. Albüm ve single çalışmalarıyla rap dünyasında istikrarlı bir yükseliş yakalayan Motive, modern Türk hip-hop sahnesinin dikkat çeken temsilcilerinden biri olarak öne çıkmaktadır.');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`KullaniciID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Tablo için indeksler `listeler`
--
ALTER TABLE `listeler`
  ADD PRIMARY KEY (`ListeID`),
  ADD KEY `KullaniciID` (`KullaniciID`);

--
-- Tablo için indeksler `muzikler`
--
ALTER TABLE `muzikler`
  ADD PRIMARY KEY (`MuzikID`),
  ADD KEY `SanatciID` (`SanatciID`);

--
-- Tablo için indeksler `odemeler`
--
ALTER TABLE `odemeler`
  ADD PRIMARY KEY (`OdemeID`),
  ADD KEY `KullaniciID` (`KullaniciID`),
  ADD KEY `UyelikID` (`UyelikID`);

--
-- Tablo için indeksler `playlistmuzik`
--
ALTER TABLE `playlistmuzik`
  ADD PRIMARY KEY (`ListeID`,`MuzikID`),
  ADD KEY `MuzikID` (`MuzikID`);

--
-- Tablo için indeksler `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`UyelikID`),
  ADD KEY `KullaniciID` (`KullaniciID`);

--
-- Tablo için indeksler `sanatcilar`
--
ALTER TABLE `sanatcilar`
  ADD PRIMARY KEY (`SanatciID`),
  ADD KEY `KullaniciID` (`KullaniciID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `KullaniciID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `listeler`
--
ALTER TABLE `listeler`
  MODIFY `ListeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `muzikler`
--
ALTER TABLE `muzikler`
  MODIFY `MuzikID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Tablo için AUTO_INCREMENT değeri `odemeler`
--
ALTER TABLE `odemeler`
  MODIFY `OdemeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `premium`
--
ALTER TABLE `premium`
  MODIFY `UyelikID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sanatcilar`
--
ALTER TABLE `sanatcilar`
  MODIFY `SanatciID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `listeler`
--
ALTER TABLE `listeler`
  ADD CONSTRAINT `listeler_ibfk_1` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`);

--
-- Tablo kısıtlamaları `muzikler`
--
ALTER TABLE `muzikler`
  ADD CONSTRAINT `muzikler_ibfk_1` FOREIGN KEY (`SanatciID`) REFERENCES `sanatcilar` (`SanatciID`);

--
-- Tablo kısıtlamaları `odemeler`
--
ALTER TABLE `odemeler`
  ADD CONSTRAINT `odemeler_ibfk_1` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`),
  ADD CONSTRAINT `odemeler_ibfk_2` FOREIGN KEY (`UyelikID`) REFERENCES `premium` (`UyelikID`);

--
-- Tablo kısıtlamaları `playlistmuzik`
--
ALTER TABLE `playlistmuzik`
  ADD CONSTRAINT `playlistmuzik_ibfk_1` FOREIGN KEY (`ListeID`) REFERENCES `listeler` (`ListeID`),
  ADD CONSTRAINT `playlistmuzik_ibfk_2` FOREIGN KEY (`MuzikID`) REFERENCES `muzikler` (`MuzikID`);

--
-- Tablo kısıtlamaları `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`);

--
-- Tablo kısıtlamaları `sanatcilar`
--
ALTER TABLE `sanatcilar`
  ADD CONSTRAINT `sanatcilar_ibfk_1` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`);
--
-- Veritabanı: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Tablo döküm verisi `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"muzikapp\",\"table\":\"kullanicilar\"}]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Tablo döküm verisi `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-12-15 09:20:35', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"tr\"}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Tablo için indeksler `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Tablo için indeksler `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Tablo için indeksler `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Tablo için indeksler `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Tablo için indeksler `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Tablo için indeksler `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Tablo için indeksler `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Tablo için indeksler `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Tablo için indeksler `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Tablo için indeksler `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Veritabanı: `spotiy`
--
CREATE DATABASE IF NOT EXISTS `spotiy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `spotiy`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `KullaniciID` int(11) NOT NULL,
  `AdSoyad` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Sifre` varchar(100) NOT NULL,
  `Rol` enum('DUZ','PREMIUM','SANATCI','ADMIN') NOT NULL,
  `KayitTarihi` date DEFAULT current_timestamp(),
  `Durum` varchar(100) DEFAULT 'AKTIF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `muzikler`
--

CREATE TABLE `muzikler` (
  `MuzikID` int(11) NOT NULL,
  `SanatciID` int(11) NOT NULL,
  `SarkiAdi` varchar(150) NOT NULL,
  `Uzunluk` int(11) DEFAULT NULL,
  `YayinTarihi` date DEFAULT NULL,
  `DosyaToken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odemeler`
--

CREATE TABLE `odemeler` (
  `OdemeID` int(11) NOT NULL,
  `KullaniciID` int(11) NOT NULL,
  `UyelikID` int(11) DEFAULT NULL,
  `OdemeTarihi` datetime DEFAULT current_timestamp(),
  `Tutar` decimal(10,2) NOT NULL,
  `ParaBirimi` varchar(10) DEFAULT 'TRY',
  `OdemeYontemi` varchar(50) DEFAULT NULL,
  `Durum` enum('BASARILI','BASARISIZ','IADE') DEFAULT 'BASARILI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `playlistler`
--

CREATE TABLE `playlistler` (
  `PlayListID` int(11) NOT NULL,
  `KullaniciID` int(11) NOT NULL,
  `ListeAdi` varchar(50) NOT NULL,
  `Aciklama` text DEFAULT NULL,
  `Gorunurluk` enum('PUBLIC','PRIVATE') DEFAULT 'PRIVATE',
  `OlusturulmaTarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `playlist_music`
--

CREATE TABLE `playlist_music` (
  `PlaylistID` int(11) NOT NULL,
  `MuzikID` int(11) NOT NULL,
  `SiraNo` int(11) DEFAULT NULL,
  `EklemeTarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `premium_uyelikler`
--

CREATE TABLE `premium_uyelikler` (
  `UyelikID` int(11) NOT NULL,
  `KullaniciID` int(11) NOT NULL,
  `BaslangicTarihi` date NOT NULL,
  `BitisTarihi` date DEFAULT NULL,
  `PlanAdi` varchar(50) DEFAULT NULL,
  `Durum` enum('AKTIF','BITTI','IPTAL') DEFAULT 'AKTIF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sanatcilar`
--

CREATE TABLE `sanatcilar` (
  `SanatciID` int(11) NOT NULL,
  `KullaniciID` int(11) NOT NULL,
  `SahneAdi` varchar(100) DEFAULT NULL,
  `Biyografi` text DEFAULT NULL,
  `OnayDurumu` enum('Bekliyor','Onaylandı','Red') DEFAULT 'Bekliyor',
  `OlusturmaTarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`KullaniciID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Tablo için indeksler `muzikler`
--
ALTER TABLE `muzikler`
  ADD PRIMARY KEY (`MuzikID`);

--
-- Tablo için indeksler `odemeler`
--
ALTER TABLE `odemeler`
  ADD PRIMARY KEY (`OdemeID`),
  ADD KEY `fk_odeme_kullanici` (`KullaniciID`),
  ADD KEY `fk_odeme_uyelik` (`UyelikID`);

--
-- Tablo için indeksler `playlistler`
--
ALTER TABLE `playlistler`
  ADD PRIMARY KEY (`PlayListID`),
  ADD KEY `fk_playlist_kullanici` (`KullaniciID`);

--
-- Tablo için indeksler `playlist_music`
--
ALTER TABLE `playlist_music`
  ADD PRIMARY KEY (`PlaylistID`,`MuzikID`),
  ADD KEY `fk_pm_muzik` (`MuzikID`);

--
-- Tablo için indeksler `premium_uyelikler`
--
ALTER TABLE `premium_uyelikler`
  ADD PRIMARY KEY (`UyelikID`),
  ADD KEY `fk_pu_kullanici` (`KullaniciID`);

--
-- Tablo için indeksler `sanatcilar`
--
ALTER TABLE `sanatcilar`
  ADD PRIMARY KEY (`SanatciID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `KullaniciID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `muzikler`
--
ALTER TABLE `muzikler`
  MODIFY `MuzikID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `odemeler`
--
ALTER TABLE `odemeler`
  MODIFY `OdemeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `playlistler`
--
ALTER TABLE `playlistler`
  MODIFY `PlayListID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `premium_uyelikler`
--
ALTER TABLE `premium_uyelikler`
  MODIFY `UyelikID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sanatcilar`
--
ALTER TABLE `sanatcilar`
  MODIFY `SanatciID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `odemeler`
--
ALTER TABLE `odemeler`
  ADD CONSTRAINT `fk_odeme_kullanici` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_odeme_uyelik` FOREIGN KEY (`UyelikID`) REFERENCES `premium_uyelikler` (`UyelikID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `playlistler`
--
ALTER TABLE `playlistler`
  ADD CONSTRAINT `fk_playlist_kullanici` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `playlist_music`
--
ALTER TABLE `playlist_music`
  ADD CONSTRAINT `fk_pm_muzik` FOREIGN KEY (`MuzikID`) REFERENCES `muzikler` (`MuzikID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pm_playlist` FOREIGN KEY (`PlaylistID`) REFERENCES `playlistler` (`PlayListID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `premium_uyelikler`
--
ALTER TABLE `premium_uyelikler`
  ADD CONSTRAINT `fk_pu_kullanici` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanicilar` (`KullaniciID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Veritabanı: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
