-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Ara 2025, 18:49:52
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
  `SarkiSozleri` varchar(2500) NOT NULL,
  `Uzunluk` varchar(10) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `UrlToken` varchar(255) DEFAULT NULL,
  `pictures` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `muzikler`
--

INSERT INTO `muzikler` (`MuzikID`, `SanatciID`, `SanatciAdi`, `SarkiAdi`, `SarkiSozleri`, `Uzunluk`, `Tarih`, `UrlToken`, `pictures`) VALUES
(40, 1, 'Wegh', '16-24', '16\'yken iki tane p*çten tornavida yemiş yalpalamış\r\nTek başına tek bir camış kalamışı kurcalamış\r\n17\'ydi kavga etmiş lavuğun 3 de çocuğu varmış\r\nSonradan öğrenmiş kulak kanamış ve kalkamamış\r\n18\'de aşık olmuş yanlış insan kalbi yokmuş\r\nOnca kilometre yapmış bir tek ondan hasar almış\r\n19\'dan sonrasını anlatmaya üşenirmiş\r\n23\'ü yeni bitmiş 24\'ten yaş almış\r\nSaygımı hak etmeyen insanlara göstermişim\r\nBüyüyorum\r\nYalan hikayelerine yol verdim\r\nHiçbir şey yokken bile milyonlukmuşum\r\nFarkına geç vardım\r\nSıkıntısız yaşamakken tek derdim\r\nKan deli durmuyorken\r\nKral mral bilmiyorken\r\nNasıl oldu bu şekil bir sinemaya denk geldik\r\nOlanlar olacakların teminatı\r\nBundan artık emin oldum\r\nTek giderim dostum çünkü tek geldim\r\nMutlusun üzgünsem\r\nRuhunu s*k*yim\r\nSallamıyorum sanma\r\nÜç kuruş beynin var a*cık\r\nAnlamıyorum sanma\r\nMayan bozuk yazık\r\nBunu örtemiyorsun ne yapsan\r\nSenden bir on tane gelsin\r\nAnlamı yok azsa\r\nZannettim maharetim yok\r\nGidip duvarlarla paslaştım \"çocuk gibi\" hiç usanmadan\r\nÇakılan çiviler yamuk inan suçlusu da yok\r\nBabam büyük adam büyük olmadan\r\nDüşündüm bir iki kere gerekmiyorken bir sebep\r\nArtık affetmiyorum hiç uzatmadan\r\nYola çıktığım efeyle şimdikisi biraz farklı\r\nBozup arif oldum hiç bozulmadan\r\nİnanılmaz yanlışlarımı çok doğru sanmışlığım var\r\nSevgi istemeyen çok insanı sevmişliğim var\r\nBunlar efendilikten de değil salmışlığımdan\r\nArtık kaçıyorum eskiden hep savaştığımdan\r\nKuşkularım azaldılar, bunlar merhametle paralel\r\nNeden çekmeye çalıştım ki kıyamete bariyer\r\nNasıl oldu anlamadım hep kafamda bere var\r\nBoşa harca birçoğunu çok mühimken seneler\r\nBoşa harca birçoğunu çok mühimken seneler\r\nBoşa harca birçoğunu çok mühimken seneler', '', '2025-12-15', '/music/wegh_16-24.mp3', '/pictures/wegh_16-24_cover.png'),
(41, 1, 'Wegh', 'Bu Ben Olmamak', 'Yanlışımla iç içeyim\r\nBu dünyada geçiciyim\r\nSadece içiyim ben\r\nDönemlik sükutluk bu hayatı ellediğim gerçeğini değiştiremez\r\nBakıyorum önüme yapacak bir şey yok, geçmişimi geliştiremem\r\nİstemiyor canım hiç karmaşıkça yaşamak ama bunu değiştiremem\r\nEt, durmadan dua et, por favor mama\r\nYaklaş göt hoşafı, lüzum yok hiç korkak olmana\r\nÇiçek dalında güzelse neden buradasın ki sen?\r\nYine karıştı tüm frekanslar, bu ben olmamak\r\nNeyse, en kötü özelliğim korkak olmamak\r\nBiraz az akıl alma yolu, fazla sormamak\r\nDaimi tercih olsun hassas olmamak\r\nDüzeltmez ki hiçbir şeyi onu zorlamak\r\nHayır kurtaramaz beni tuanalar\r\nÇok enkaz birikti çünkü bende bu aralar\r\nBunu saklayamam, detay atlayamam\r\nBaktım böyle bi\' sikim olmayacak yıpranamam\r\nDesin neydin n\'oldun?\r\nOylum oylum oysun\r\nSöyle, değilse boynum kıldan ince n\'olur?\r\nİnandım bir tek kendimin yalanlarına\r\nLütfen git, benimle inatlaşma n\'olur\r\nYanlışımla iç içeyim\r\nBu dünyada geçiyim\r\nSadece içiyim ben\r\nDönemlik sükutluk bu hayatı ellediğim gerçeğini değiştiremez\r\nBakıyorum önüme yapacak bir şey yok, geçmişimi geliştiremem\r\nİstemiyor canım hiç karmaşıkça yaşamak ama bunu değiştiremem', '', '2025-12-15', '/music/wegh_bu_ben_olmamak.mp3', '/pictures/wegh_bu_ben_olmamak_cover.png'),
(42, 1, 'Wegh', 'Çok İnsan Affettim', 'Bendeki hiçbir şeyi düzeltmedi rap\r\nÖzetle her şeye uzaktayım hep\r\nBi\' tane daha yap kallavi olsun\r\nArtık sevmiyo\'m uzatmayı pek\r\nYok pazarlık, yok şikayet\r\nKurtardım derken ah nihayet\r\nKalabalıklarda yalnız kaldım\r\n3 kişi öldürdüm tek cinayetle\r\nÇok fazla tepkim yok, var fazla etkim\r\nSen kaçtıkça kaçtın, ben çektikçe çektim\r\nHer seferde sıyrıldın, tuttum zannettim\r\nYok artık hiç uğraşmam, kalbi kaybettim\r\nGösterme unuttur, insan hasettir\r\nÇok insan affettim, salaklık etmişim\r\nOturdum kendime senden bahsettim\r\nVe bugünmüş gibi anlattım geçmişi\r\nEğer kafam bozuk olursa bi\' mikrofonum darlanırmış\r\nBunu henüz yeni anladım\r\nDenedim en az 7-8 kere hafiflemek için ama unutamadım\r\nHiçbir yerde barınamadım, henüz senden arınamadım\r\nGülmek için içmiyorum hiçbir boku, unutmadım ekmeğini kanıma banıp\r\nEğer kafam bozuk olursa bi\' mikrofonum darlanırmış\r\nBunu henüz yeni anladım\r\nDenedim en az 7-8 kere hafiflemek için ama unutamadım\r\nHiçbir yerde barınamadım, henüz senden arınamadım\r\nGülmek için içmiyorum hiçbir boku, unutmadım ekmeğini kanıma banıp\r\nYediğini\r\nGörsem de sataşamadım sana\r\nBöylesiyle tek gün rastlaşamadım bile\r\nBadireler rutin oldu artık benim için\r\nAma bi\' tek senin güzelliğini atlatamadım\r\nKimselere anlatamadım\r\nSayfaları karaladım kapatamadım\r\nO anlatıp durdu ben dinlemedim\r\nSoğuk suya düştüm ama yine afallamadım\r\nYıldız mı görmek istersin bulut mu\r\nOlduğun yer hem umut hem huduttur\r\nBaktığım her şeyi sen değiştirdin\r\nAldığım yaraları da gel unuttur\r\nEğer kafam bozuk olursa bi\' mikrofonum darlanırmış\r\nBunu henüz yeni anladım\r\nDenedim en az 7-8 kere hafiflemek için ama unutamadım\r\nHiçbir yerde barınamadım, henüz senden arınamadım\r\nGülmek için içmiyorum hiçbir boku, unutmadım ekmeğini kanıma banıp\r\nEğer kafam bozuk olursa bi\' mikrofonum darlanırmış\r\nBunu henüz yeni anladım\r\nDenedim en az 7-8 kere hafiflemek için ama unutamadım\r\nHiçbir yerde barınamadım, henüz senden arınamadım\r\nGülmek için içmiyorum hiçbir boku, unutmadım ekmeğini kanıma banıp', '', '2025-12-15', '/music/wegh_cok_İnsan_affettim.mp3', '/pictures/wegh_cok_İnsan_affettim_cover.png'),
(43, 1, 'Wegh', 'Çöp Şiş', 'Avangart Rumi, has iş, çek duman, çöp şiş\r\nAskoroz flex, İs-İstanbul kapris\r\nGri köpek Mastiff, yanar yolda lastik\r\nBoğazımda pastil, adım Arif Efe, Nas değil\r\nYok bizde blacklist, olsa gözetlenemez\r\nZaten istemediğimiz kapımıza gelemez\r\nHiç boşa konuşmadım, lafım ötelenemez\r\nMemleketin yollarını gitmek için yapın\r\nHer yer kasis dolu, arabanın götü düştü yola\r\nÖyle bunu da bi\' diyim dedim\r\nEhliyetim yeni, kazasız belasız aman, hayır olsun ama\r\nHep birisi yapar gider kardeşleri yatar\r\nBu amına koyduğumun parası tüm hisleri alır\r\nArkadaşlarını satan vatanı milleti satar\r\nYine yazdım bi\' daha yazca\'m, söz uçarsa yazı kalır (ya-yazı kalır)\r\nÇoğu bizi görmez ama hepsi biraz tanır\r\nEğer atan tutan varsa otursak biraz utanır\r\nSırtım dolu kama ama olmadı hiç yara bere\r\nBi\' daha dene oynayalım senle bi\' tur daha\r\nAvangart Rumi, has iş, çek duman, çöp şiş\r\nAskoroz flex, İs-İstanbul kapris\r\nGri köpek Mastiff, yanar yolda lastik\r\nBoğazımda pastil, adım Arif Efe, Nas değil\r\nAvangart Rumi, has iş, çek duman, çöp şiş\r\nAskoroz flex, İs-İstanbul kapris\r\nGri köpek Mastiff, yanar yolda lastik\r\nBoğazımda pastil, adım Arif Efe, Nas değil', '', '2025-12-15', '/music/wegh_cop_sis.mp3', '/pictures/wegh_cop_sis_cover.png'),
(44, 1, 'Wegh', 'Geri Ver', '(Sende yaşadım seni dünyam sanıp)\r\n(Benden aldın heyecanlarımı, geri ver)\r\n(Belki söylemedim sana bunları utanıp)\r\n(Senden önce olduğum adamı bana geri ver)\r\n\r\nSende yaşadım seni dünyam sanıp, unutturdun bildiklerimi\r\nBenden aldın heyecanlarımı, geri ver, geri ver, azımsayamam\r\nBelki söylemedim sana bunları utanıp, saklıyo\'dum giydiklerini\r\nSenden önce olduğum adamı bana geri ver, geri ver, böyle yapamam\r\nSendе yaşadım seni dünyam sanıp, unutturdun bildiklerimi\r\nBendеn aldın heyecanlarımı, geri ver, geri ver, azımsayamam\r\nBelki söylemedim sana bunları utanıp, saklıyo\'dum giydiklerini\r\nSenden önce olduğum adamı bana geri ver, geri ver, böyle yapamam\r\n\r\nÇirkin hikâyemin tek süslü bölümü sensin\r\nBelki sadece bi\' kuş sesidir bütün duyduklarım\r\nGüneş ner\'den doğarsa doğsun, hep sen\'le batar artık\r\nİstiyorum sen\'le olsun bütün anılarım\r\nDünün de bugünün de senin olduğu belli zaten\r\nİnsaf edip bıraksaydın bari yarınları\r\nKırılıp döküldüm\r\nHer zerrene ihtiyacım var diye mi topluyorum sence yerde kalanları?\r\nSee upcoming rap shows\r\nGet tickets for your favorite artists\r\n\r\nYou might also like\r\nBal Biber\r\nWegh\r\nKUSURA BAKMA\r\nBLOK3\r\nRadikal Eşkiya\r\nWegh & Şehinşah\r\n\r\nOf, hissedemem artık\r\nKapılar kapalı, açamam artık\r\nOf, düzelemem artık\r\nSorunlar büyüdü, çözemem artık\r\nOf, hissedemem artık\r\nKapılar kapalı, açamam artık\r\nOf, düzelemem artık\r\nSorunlar büyüdü, çözemem artık, of\r\n\r\nSende yaşadım seni dünyam sanıp, unutturdun bildiklerimi\r\nBenden aldın heyecanlarımı, geri ver, geri ver, azımsayamam\r\nBelki söylemedim sana bunları utanıp, saklıyo\'dum giydiklerini\r\nSenden önce olduğum adamı bana geri ver, geri ver, böyle yapamam\r\nSende yaşadım seni dünyam sanıp, unutturdun bildiklerimi\r\nBenden aldın heyecanlarımı, geri ver, geri ver, azımsayamam\r\nBelki söylemedim sana bunları utanıp, saklıyo\'dum giydiklerini\r\nSenden önce olduğum adamı bana geri ver, geri ver, böyle yapamam', '', '2025-12-15', '/music/wegh_geri_ver.mp3', '/pictures/wegh_geri_ver_cover.png'),
(45, 1, 'Wegh', 'Güldüğün Gün', 'Gözlerin, kıvrımların, o günlerin hepsi\r\nTüm anları unuttuğum inatlarım\r\nBu kalpten giderken utanmadın mı?\r\nSızlatıyo\' bu his benim kemiklerimi\r\nHiç bakmadan anlıyo\'dum istediğini\r\nAkıttım tüm yaşlarımı gizli gizli hep\r\nBen anlamadan alıyo\'dun istediğini\r\nBana öyle güldüğün gün var ya\r\nBakamam resimlerine hâlâ\r\nÇözülsün diye sebepler vardı\r\nAma bitmedi gitti seninle davam\r\nBana öyle güldüğün gün var ya\r\nBakamam resimlerine hâlâ\r\nÇözülsün diye sebepler vardı\r\nAma bitmedi gitti seninle davam\r\nGerçektеn uzak hayaller var ya\r\nTutulmayan sözlerimiz var ya\r\nNe kadar uzaksın, nе kadar yakın?\r\nBen bilmiyorum hiçbi\' şeyi, bu ne zor ya\r\nGözler affetmez, sözler vahşetle\r\nBakarsa (ah-ah) bakarsa (ah-ah)\r\nGözler affetmez, sözler vahşetle\r\nBakarsa (ah-ah) bakarsa (ah-ah)\r\nBana öyle güldüğün gün var ya\r\nBakamam resimlerine hâlâ\r\nÇözülsün diye sebepler vardı\r\nAma bitmedi gitti seninle davam\r\nBana öyle güldüğün gün var ya\r\nBakamam resimlerine hâlâ\r\nÇözülsün diye sebepler vardı\r\nAma bitmedi gitti seninle davam', '', '2025-12-15', '/music/wegh_guldugun_gun.mp3', '/pictures/wegh_guldugun_gun_cover.png'),
(46, 1, 'Wegh', 'Halit Abi', 'Bu repçiler\r\nBu repçiler\r\nBu rapçiler bok kafalı\r\nSpotify Unkapanı\r\nBosphorus\'ta orospu bol\r\nZor bulursun muntazamı\r\nDevir kötü, kola götü\r\nGöremezsin manzarayı\r\nGetir götür, işin budur\r\nBul karayı, al parayı\r\nAlttan almam, pişirmeden\r\nIsırırım zarganayı\r\nSafsatanı aydan aya yap da\r\nBiraz sallayalım\r\nSarak desek video değilsin\r\nSeni nasıl atlayalım\r\nBu bok sağlığa zararlı\r\nİçmeyelim, satmayalım\r\nHalit Abi seni bulur\r\nKapı çalar tak tak\r\nTitremez bile hiç eli silah\r\nYapar pat pat\r\nBeyaz kefen, siyah North Face\r\nArabada paf paf\r\nBana mallar caz yapamaz\r\nYavrum Halit Abi seni bulur\r\nKapı çalar tak tak\r\nTitremez bile hiç eli silah\r\nYapar pat pat\r\nBeyaz kefen, siyah North Face\r\nArabada paf paf\r\nBana mallar caz yapamaz\r\nAnca yapar yoo\r\nKapı çalar tak tak\r\nYasak ama bakmak\r\nGece yatmak yok\r\nSabahları kalkmak\r\nYuvarlandı tam tur\r\nSana kaldı yakmak\r\nElek oldu kasnak\r\nOrospular parlar\r\nParlar hep\r\nHalit Abi seni bulur\r\nKapı çalar tak tak\r\nTitremez bile hiç eli silah\r\nYapar pat pat\r\nBeyaz kefen, siyah North Face\r\nArabada paf paf\r\nBana mallar caz yapamaz\r\nYavrum Halit Abi seni bulur\r\nKapı çalar tak tak\r\nTitremez bile hiç eli silah\r\nYapar pat pat\r\nBeyaz kefen, siyah North Face\r\nArabada paf paf\r\nBana mallar caz yapamaz\r\nAnca yapar', '', '2025-12-15', '/music/wegh_halit_abi.mp3', '/pictures/wegh_halit_abi_cover.png'),
(47, 1, 'Wegh', 'Karardı Bulutlar', 'Ah, karakterim, ah\r\nYeah\r\nBunaldım, yeah\r\n(Unuttuğumu sandım ama kaybolmamış renklerimiz)\r\n(Belki bi\' gün ummadığın bi\' anda sen\'le denk geliriz)\r\n(Aynı hiddetteyse hisler, aynı şiddetteyse aşk)\r\n(İstemsizce bozulur zaten o günkü denklemimiz)\r\nGece burnum kanadı, her yerde onu aradım\r\nGözüm fazla karadır (yeah) sana huzuru aratır (yeah)\r\nKalemim bi\' zımpara (ah) af istemeden kanatırım (ey-ey, ey, ey)\r\nN\'olcakmış her yanım kanadı bak\r\nGözlerim aynı, karardı bulutlar\r\nGördüm kendimi, farklı bu kez\r\nN\'olcak bilinmez, hep hеr şey hep aynı\r\nN\'olcağını söyle, hadi, kalmadı mı?\r\nGözlеrim aynı, karardı bulutlar\r\nGördüm kendimi, farklı bu kez\r\nN\'olcak bilinmez, hep her şey hep aynı\r\nN\'olcağını söyle, hadi, kalmadı mı?\r\nÜzgün olmak var ama\r\nGöz önünde ağlama, gören olur, ay-ay-ay-ay-ay\r\nDüzgün kalmak zor biraz\r\nGüderken bi\' ton dava hedef oldum, ay-ay-ay-ay-ay\r\nÜzgün olmak var ama\r\nGöz önünde ağlama, gören olur, ay-ay-ay-ay-ay\r\nDüzgün kalmak zor biraz\r\nGüderken bi\' ton dava hasta oldum, ay-ay-ay-ay-ay\r\nLe-le-le, le-le-le (yeah, yeah)\r\nLe-le-le, le-le-le (ay-ay-ay-ay)\r\nLe-le-le, le-le-le (ay, le-le-le)\r\nLe-le (yeah, yeah, yeah, yeah, yeah, yeah, yeah)\r\nGözlerim aynı, karardı bulutlar\r\nGördüm kendimi, farklı bu kez\r\nN\'olcak bilinmez, hep her şey hep aynı\r\nN\'olcağını söyle, hadi, kalmadı mı?\r\nGözlerim aynı, karardı bulutlar\r\nGördüm kendimi, farklı bu kez\r\nN\'olcak bilinmez, hep her şey hep aynı\r\nN\'olcağını söyle, hadi, kalmadı mı?', '', '2025-12-15', '/music/wegh_karardi_bulutlar.mp3', '/pictures/wegh_karardi_bulutlar_cover.png'),
(48, 1, 'Wegh', 'Kennedy\'i Ben Vurdum', 'Şişe şişe Belvedere\r\nDemem, \"El âlem ne der?\"\r\nKennedy\'i ben vurdum\r\nHiç de sormadan neden\r\n(Wegh, göğe serdim)\r\n(Allah verir bereket)\r\nŞişe şişe Belvedere\r\n(Göğe serdim)\r\nDemem, \"El âlem ne der?\"\r\n(Wegh)\r\nKennedy\'i ben vurdum\r\n(Göğe serdim)\r\n(Allah veri-, Allah verir bereket)\r\nŞişe şişe Belvedere\r\n(Göğe serdim)\r\nDe-demem, \"El âlem ne der?\"\r\n(Göğe serdim)\r\nKennedy\'i ben vurdum\r\n(Göğe serdim)\r\nKe-Kennedy\'i ben vurdum\r\nKennedy\'i ben vurdum evlerine dalıp\r\nGöğe serip kaçtım, ellerinde yok hiç kanıt\r\nBiz biterse damıtırız, aramızda hafız\r\nAz kişi, sık safız, rakip sakız, çiğneyip atarız\r\nTa-ta-ta-ta-ta-ta\r\nTaktım bi\' kıza kafayı, molotof attım havaya\r\nİstemedim üç şey, bi\' tek tobacco açtım havaya\r\nTaktım bi\' kıza tıpayı, bırakmadım hiç onaya\r\nİstediğin tek şey bi\'çok şeyin gelmesi kolaya\r\nAma öyle yok, yok (hiç)\r\nAma öyle yok, yok hiç\r\nAma öyle yok, yok (hiç)\r\nAma öyle yok, yok hiç, hiç\r\nŞişe şişe belvedere\r\nDemem, \"El âlem ne der?\"\r\nKennedy\'i ben vurdum\r\nHiç de sormadan neden\r\nŞişe şişe Belvedere\r\nDemem, \"El âlem ne der\"\r\nKennedy\'i ben vurdum\r\nHiç de sormadan neden\r\n(Wegh, göğe serdim)\r\n(Allah verir bereket)\r\nŞişe şişe Belvedere\r\n(Göğe serdim)\r\nDemem, \"El âlem ne der\"\r\n(Wegh)\r\nKennedy\'i ben vurdum\r\n(Göğe serdim)\r\n(Allah veri-, Allah verir bereket)\r\nŞişe şişe Belvedere-dere\r\nDe-demem, \"El âlem ne der?\"\r\nDer, der, Kennedy\'i ben vurdum, vurdum\r\nKe-Kennedy\'i ben vurdum\r\nA-A-A-Allah verir bereket', '', '2025-12-15', '/music/wegh_kennedy\'i_ben_vurdum.mp3', '/pictures/wegh_kennedy\'i_ben_vurdum_cover.png'),
(49, 1, 'Wegh', 'Kin', 'Mistik bi’ his\r\nFarkındasın içindeki şeytanın da\r\nSorun yok, o da seyreder, kontrol benim\r\nKoridor kime açılır, nedir ki yolun, bi’ sonu yok\r\nŞehir poligon, şehir poligon\r\nYılanlı yol ekip hep rahat olsa çetrefil de\r\nSorun yok, verir tam puan\r\nNeyse, hak ettiğin sonuç o\r\nHibrit aqua olsun afiyet ve yürü go\r\nRuhum vukuat vuku-vukuat, wow\r\nSana söyledim oynama zehirli sevgiyle\r\nKesilmiş ipi bak uçurtmanın bi’ sahibi yok\r\nİyice derledim kaydedilmiş görüntüleri\r\nKurda tuzak kurulmuş başka açıklaması yok\r\nDevrildi tüm gözler açılmayacak bi’ kapı yok\r\nKilidi çeviren anahtarın sahipleri kim\r\nİçimde besledim te çocukluktan bu yana kin\r\nO yana aile, bu yana kin\r\nDevrildi tüm gözler açılmayacak bi’ kapı yok\r\nKilidi çeviren anahtarın sahipleri kim\r\nİçimde besledim te çocukluktan bu yana kin\r\nO yana aile, bu yana kin\r\nYalanlara kanmam çoktan o yolları geçtim\r\nDimdik yokuşları çıktım\r\nPişkin kuralları sessiz\r\nArtık bu bi’ oyun risk değil\r\nSal, püfür püfür essin\r\nGö-görüyorum çift çift lakin bi’ tek Allah tektir\r\nRumi Celo win easy, senkronu kes\r\nSezon sonu final yok, yaza artar on vites\r\nDoğru, doğru habitat atar yanlışa kick ass (siktir)\r\nYanlış hakikat satar salaklara tez\r\nTakım taklavat hazır\r\nHazır tastamam iyi\r\nBurda çoklar az ama sende yoksa n’apim\r\nGizli, gizli kaz kuyu\r\nKürek yoksa at göle\r\nFazla saklama\r\nYanlış ortadayken daha iyi\r\nSana söyledim oynama zehirli sevgiyle\r\nKesilmiş ipi bak uçurtmanın bi’ sahibi yok\r\nİyice derledim kaydedilmiş görüntüleri\r\nKurda tuzak kurulmuş başka açıklaması yok\r\nDevrildi tüm gözler açılmayacak bi’ kapı yok\r\nKilidi çeviren anahtarın sahipleri kim\r\nİçimde besledim te çocukluktan bu yana kin\r\nO yana aile, bu yana kin\r\nDevrildi tüm gözler açılmayacak bi’ kapı yok\r\nKilidi çeviren anahtarın sahipleri kim\r\nİçimde besledim te çocukluktan bu yana kin\r\nO yana aile, bu yana kin', '', '2025-12-15', '/music/wegh_kin.mp3', '/pictures/wegh_kin_cover.png'),
(50, 1, 'Wegh', 'Kum Saati', '(Ü-ü-üç)\r\n(Narco, wha-what the—)\r\n\r\nBütün şarkıları tek bi\' fotoğrafa bakıp yazdım\r\nTek karede bu kadar çok anı olamaz\r\nBaktığım her yerde onu görüp yapamazdım\r\nBen de kapattım gözlerimi hep gerçek olana\r\nKıyametler kopsun diye beklediğim oldu\r\nVakti ziyan ettim ama artık kum saati doldu\r\nSöylemesi kolay lakin anlaması zordu\r\nHerkesin bi\' yalanı vardı ve benimkisi oydu\r\n\r\nSeni dertsiz olmaktan kurtaran o hikâyeler\r\nBeni sensiz olmaktan kurtarır mı, hikâyeden?\r\nSeni dertsiz olmaktan kurtaran o hikâyeler\r\nBeni sensiz olmaktan kurtarır mı, hikâyeden?\r\n\r\nGörsem o banktaki bizi, inan, sarıl\'caktım\r\nArkandan hiç söz etmedim çünkü buna darıl\'caktın\r\nHakkında duyduğum şeyler var dostlarımdan\r\nBeni astığın o iple başkasına salıncaktın\r\nOtuzunda göçer gibiyim\r\nSeni görsem rüyamda koşup da öper gibiyim, wow\r\nŞimdi baktım da geçmişteki bize\r\nSanırım seninle Eyşan ve Ömer gibiyiz\r\nAnlattım her şeyi geçtiğimi\r\nHata olduğunu bilirim seni seçtiğimin\r\nSen benim için sadece bi\' sigara yak\r\nBen zaten yakmıştım bizim için gençliğimi, wow\r\nKandırdım kendimi, dedim \"Seni unuttum\"\r\nUçan güvercinler gibi, sevmek boşa umuttur\r\nYaptığını asla unutmıy\'cam, bebek\r\nBaşkasının gülü olmak için bahçeleri kuruttun\r\n\r\nSeni dertsiz olmaktan kurtaran o hikâyeler\r\nBeni sensiz olmaktan kurtarır mı, hikâyeden?\r\nSeni dertsiz olmaktan kurtaran o hikâyeler\r\nBeni sensiz olmaktan kurtarır mı, hikâyeden?', '', '2025-12-15', '/music/wegh_kum_saati.mp3', '/pictures/wegh_kum_saati_cover.png'),
(51, 1, 'Wegh', 'Murabba', 'Mantık buz, donmuş çok\r\nKalbim beş yüz santigrat\r\nEn az bin mil mesafe var ben\'le benim aramda\r\nHayli zor onarmak bizi moralman\r\nHer gün anlatırken ikimizi kötü murabba\r\nMantık buz, donmuş çok\r\nKalbim beş yüz santigrat\r\nEn az bin mil mesafe var ben\'le benim aramda\r\nHayli zor onarmak bizi moralman\r\nHer gün anlatırken ikimizi kötü murabba\r\nMuamma durumum, stres sarılır koala\r\nÇok yorulup boğuldum, beni kurtar Tuana\'m\r\nBu hata duramam ama sensiz zor epey\r\nÇok zor yürümek ama koşsam duramam\r\nU-u-u-uyumak çok zor, daimi kâbus\r\nBasıyo\'m her gece melatonini\r\nBe-be-belli değil n\'aptığım, kendimi saldım\r\nBozdum bütün bu anatomimi\r\nŞükürler Allah\'a, yaşıyorum hâlâ\r\nBöyle müşkül durumlara tabiyim\r\nYazık değil fazla mühimliğini saldım\r\nAramıyo\'m artık serotonini\r\nAz önce anladım delirdiğimi\r\nAma bundan da pek emin değilim\r\nGeziyorum her gece benim beyni\r\nBu şekilde büyütüyo\'m derebeyimi\r\nHerhangi bi\' çeteye de mensup değilim\r\nMünferitim, absürt di mi? Tekil biriyim\r\nSöyleyince gerçekleri deli deyilir\r\nAma en azından sizin gibi yavşak değilim, eh\r\nYa, ya\r\nBırak onu\r\nGerilir\r\nRuhum donmuş, kalbim buz (woo)\r\nMantık buz, donmuş çok, ya (ya, ya, ya, ya)\r\nMantık buz, donmuş çok\r\nKalbim beş yüz santigrat\r\nEn az bin mil mesafe var ben\'le benim aramda\r\nHayli zor onarmak bizi moralman\r\nHer gün anlatırken ikimizi kötü murabba (ya, ya, ya)\r\nMantık buz, donmuş çok\r\nKalbim beş yüz santigrat\r\nEn az bin mil mesafe var ben\'le benim aramda\r\nHayli zor onarmak bizi moralman\r\nHer gün anlatırken ikimizi kötü murabba\r\nMantık buz, donmuş çok\r\nKalbim beş yüz santigrat\r\nEn az bin mil mesafe var ben\'le benim aramda\r\nHayli zor onarmak bizi moralman\r\nHer gün, kö-kötü murabba', '', '2025-12-15', '/music/wegh_murabba.mp3', '/pictures/wegh_murabba_cover.png'),
(52, 1, 'Wegh', 'Rumi Madafaka', 'Rumi Aladeen, madafaka, para win\r\nÖnce yere bassın ayakların, arabadan in\r\nSınır azami ve alayı asabi\r\nGolü atabilme ihtimalin varsa pas at\'im\r\nBütün dert, tasa, düşman, hepsini sikiyim\r\nTek bi\' kızı seviyorum ama çoğunun tipiyim\r\nVar kem göze yarrak, yersen ısıtiyim, ya\r\nPsikolojim sağlam, aynen, ananı sikiyim\r\nGöğe serdim hereke, Allah verir bereket\r\nBen bu şehre o masayı yakmak için geldim\r\nTutulduk bi\' merete, yayınlasın TRT\r\nBiz de yayı yavşağa ok atmak için gerdik\r\nGöğe serdim hereke, Allah verir bereket\r\nBen bu şehre o masayı yakmak için geldim\r\nTutulduk bi\' merete, yayınlasın TRT\r\nBiz de yayı yavşağa ok atmak için gerdik\r\nÇemberimde gül oya, gülmedim doya doya\r\nGöt oğlanı dolu etraf, bitmedi koya koya\r\nÇıktı ortaya foya, gittim yüzmeye koya\r\nİki kulaç atıp yetiştim hemen manitaya\r\nUzanmış dubalara, o güneşten ışık alır\r\nDedim, \"Sana bi\' şe\' ver\'ce\'m sert, kaya, başı kalın\"\r\n\"Gel\" dedi, \"Açılalım\", hop atladık, karışalım\r\nBi\' panzehir taşıyorum, dön, sana aşılarım\r\nRumi Aladeen, madafaka, para win\r\nÖnce yere bassın ayakların, arabadan in\r\nSınır azami ve alayı asabi\r\nGolü atabilme ihtimalin varsa pas at\'im\r\nBütün dert, tasa, düşman, hepsini sikiyim\r\nTek bi\' kızı seviyorum ama çoğunun tipiyim\r\nVar kem göze yarrak, yersen ısıtiyim, ya\r\nPsikolojim sağlam, aynen, ananı sikiyim', '', '2025-12-15', '/music/wegh_rumi_madafaka.mp3', '/pictures/wegh_rumi_madafaka_cover.png'),
(53, 1, 'Wegh', 'Sana Vuruldum', 'Yalandan da olsa gül bana\r\nHiç niyetim yok unutmaya\r\n\r\nHep içime gömdüm özlemimi\r\nKırdım bi′ dal, kıstım gözlerimi\r\nOna yazdığım şarkıyı bi\' tek ben dinledim\r\nSonra da değiştim sözlerini\r\nİstemedim beni istemeni\r\nBunu istemeden yaptım, hisle değil\r\nSöylesene, senin istediğin ne?\r\nHissettiklerini öğreneyim\r\nKafama tutuldu silah ama ben bi′ tek sana vuruldum\r\nÇarkı bi\'çok kez çevirdim ama yine sana kuruldum\r\nYarın olmıy\'cak gibi olur ya bazen\r\nBundan yoruldum, çoktan duruldum\r\nSırttan vuruldum, kalktım, unuttum hep\r\n\r\nBenden\r\nBenden bu kadar\r\nOlabilir her şey\r\nKu-kurulan\r\nO-olabilir, o-\r\nKu-kurulan bozulur, olabilir her şey\r\n\r\nKu-ku-ku-kurulan bozulur, olabilir her şey\r\nBenden bu kadar emin olma\r\nHâ-hâl hatır kalmadı, gözlüğüm Armani\r\nHer şeyi söyledim demin or′da\r\nYeni geldim senin evin or′dan\r\nVar EYP iki çivi bombam\r\nYakalarsan hepsi senin olsun\r\nAma kaşınırsan biri sana patlar\r\nBen ilişmem, sana Arap atlar\r\nBende alamayacağın kadar malafat var\r\nBi\' laf atsam kopar ana hatlar\r\nSenin kafa patlar, bi′ tek anan ağlar\r\nÇok açılıp cayma salavattan\r\nBen Hasan\'ım geldim, Ulubat′tan\r\nSıkıldım artık solumaktan\r\nBeni anlamak isteyen okur, anlar\r\nBi\' mana arama, bunları anlatmam\r\nAslında bizim için iyi değil\r\nBüyüdüm mezar dolu sokaklarda\r\nAnladım ki ölü temiz, diri değil\r\nHiçbiri kendinden emin değil\r\nZaten ben çoktan unuttum yenilmeyi\r\nKötü gün geçer, düşünmem eğilmeyi\r\nBenden başkası uzuv olur, beyin değil, ah\r\nUzun zaman önce çizilmiş bi′ resim\r\nHikâyeyi anlatamaz\r\nGeldik sona, ahir zaman\r\nHayır, sana inan bi\' an katlanamam\r\nAyır zaman bayılmadan\r\nHayır, hayır, sana bunu anlatamam\r\n\r\nYalandan da olsa gül bana\r\nHiç niyetim yok unutmaya\r\n(Yalandan da olsa gül bana, gül)\r\n(Hiç niyetim yok unutmaya)\r\noutro\r\nVu-vu-vu-vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum\r\nVu-vu-vu-vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum\r\nVu-vu-vu-vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum, vuruldum', '', '2025-12-15', '/music/wegh_sana_vuruldum.mp3', '/pictures/wegh_sana_vuruldum_cover.png'),
(54, 1, 'Wegh', 'Yağsın Dünya Üstüme', 'Yağsın dünya üstüme, zaten patlamadı mı\r\nKalp belalı göz ama hiç yeke yek kalır mı\r\nYar sana gelemedim günler ardına koyup\r\nKestim aciz elimi, ah dedim bunlar ah\r\nTekirdağ\'dan Pendik\'e, otobanda mermi\r\nFalsolu şeklim hiç durmuyo\'m efendi\r\nİki büyük laf var birini öğrendim\r\nOnu da unuttum yoksa söylerdim\r\nKasmadım fazla baktım öğrendim\r\nKimseye bilenmedim hep debelendim\r\nErtelesem de hep sana geldim\r\nVar iki mentorum ben bi\' de kendim\r\nBen senelerdir tekim\r\nGötü yiyen gelip bölsün, bu kadar da netim\r\nHavlayan köpek ısırmaz hepsi olur petim (Wegh Rumi)\r\nYağsın dünya üstüme zaten patlamadı mı\r\nKalp belalı göz ama hiç yeke yek kalır mı\r\nYar sana gelemedim günler ardına koyup\r\nKestim aciz elimi, ah dedim bunlar ah', '', '2025-12-15', '/music/wegh_yagsin_dunya_ustume.mp3', '/pictures/wegh_yagsin_dunya_ustume_cover.png'),
(55, 1, 'Wegh', 'Yanlışlarla Karşılaştım', 'Ya-ya-ya-ya-ya-yanlışlarla karşılaştım\r\nDo-do-do-do-do-doğrularla yaşarken\r\nYanlışlarla karşılaştım doğrularla yaşarken\r\nYaşarken öldüm bardağımdan damlalarım taşarken\r\n\"Yaş erken\" dedim, hor kullandım kendimi hep koşarken\r\nSabırsa sabır, ilerledik sıkıntılar coşarken\r\nHayat bazen olumsuz, kaldım yedi ay konumsuz\r\nBu insanlar hep sıkıntılı, kalmadım hiç sorunsuz\r\nNeyse ne, bunlar önemsiz, bıraktım, aklım soyulsun\r\nBazı sorular bilensiz, bilmek isteyen dirensin\r\nİnsan olmak zor mudur, ölümden öte köy mü var?\r\nApaçık ortada tüm her şey, ondan büyük göz mü var?\r\nDaha büyük söz mü var? Kendimin bana özrü var\r\nHiçbi\' şey kalmadı artık, sadece tek resmi var\r\nYa-ya-ya-ya-ya-yanlışlarla karşılaştım\r\nDo-do-do-do-do-doğrularla yaşarken\r\nYa-ya-ya-ya-ya-yanlışlarla karşılaştım\r\nDo-do-do-do-do-doğrularla yaşarken (alo?)\r\nDağdan indim, kovdum bağdan\r\nÜstümde çift silahtan fazlası var, bir bakışta çözemezsin (yeah)\r\nAmcık ağzın boş açılır, \"Yiy\'ce\'m\" sanar, yiyemezsin (şş)\r\nÖyle fazla esme, çocuk, ben sikmeden ölemezsin\r\nÇektim harbiden de resti, bak (brr) akşam beşe bi\' teslimat\r\nHamza\'m yaşatır festival, bu mermilerden resital (he)\r\nNe derlerse desinler, adamlığın da testi var (aynen)\r\nGönderdim, bak, dereye, elinde çatlak testi var (ah-ha)\r\nİnan, Keso geçti, emmi, içinden tüm ateşlerin\r\nBıraktı tüm domdomları bacaklara kardeşlerim (wo, wo)\r\nYönettim bi\' dağ evinden, 3310, tüm işleri\r\nAynen, sen de biz gibisin, bırakın da bu işleri\r\nYanlışlara ateş ettim memurlardan kaçarken', '', '2025-12-15', '/music/wegh_yanlislarla_karsilastim.mp3', '/pictures/wegh_yanlislarla_karsilastim_cover.png'),
(56, 2, 'NursenaYener', 'Ah Bu Şarkıların Gözü Kör Olsun', '\r\n\r\n \r\nÖyle dudak büküp hor gözle bakma\r\nBırak küçük dağlar yerinde dursun\r\n \r\nÇoktan unuturdum ben seni çoktan\r\nAh bu şarkıların gözü kör olsun\r\n \r\nGüzelsen güzelsin\r\nYok mu benzerin\r\nGoncadır ilk hali\r\nBütün güllerin\r\n \r\nAklımda kalmazdı yüzün, ellerin\r\nAh bu şarkıların gözü kör olsun\r\n \r\nBir gülüşün var ki kaş çatar gibi\r\nEn sıcak sözlerin azarlar gibi\r\n \r\nHiç bağlanır mıydım çocuklar gibi\r\nAh bu şarkıların gözü kör olsun\r\n \r\nSonunda tuz bastım\r\nGönül yarama\r\nNice dağlar koydun\r\nNice arama\r\n \r\nSeni terkedip de gitmek var ama\r\nAh bu şarkıların gözü kör olsun', '', '2025-12-15', '/music/nursenayener_ah_bu_sarkilarin_gozu_kor_olsun.mp3', '/pictures/nursenayener_ah_bu_sarkilarin_gozu_kor_o'),
(57, 2, 'NursenaYener', 'Aşkın Yalanmış', 'Bazıları acı sever\r\nBazıları bela çeker\r\nBıçağın kestiği yeri\r\nYara izlerini sever\r\nBazıları sonları sevmez\r\nBazıları bağlanmak ister\r\nEski bi′ kasete kopmuş bandı\r\nYapıştırıp tekrar dinler\r\n\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\n\r\nBazıları kurşun asker\r\nYakıp yıkıp esmek ister\r\nKara kanatları omzunda\r\nGünahı içine çeker\r\nBazıları mazide gezer\r\nBazıları hasret özler\r\nÇoktan ölmüş bitmiş aşkı\r\nMezardan çıkarıp öpmek ister\r\n\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\n\r\nDelisin, senin kadar ben de\r\nDeliyim, deliyim\r\nİpin ucuna sürüklersin beni\r\nGelirim, gelirim\r\nDelisin, senin kadar ben de\r\nDeliyim, deliyim\r\nİpin ucuna sürüklersin beni\r\nGelirim, gelirim\r\n\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\n\r\nBen sana nasıl uyduysam?\r\nAşkın yalanmış, aşkın yalanmış\r\nKollarında uyumuşum\r\nHepsi rüyaymış, hepsi rüyaymış\r\nBen sana nasıl uyduysam?', '', '2025-12-15', '/music/nursenayener_askin_yalanmis.mp3', '/pictures/nursenayener_askin_yalanmis_cover.png'),
(58, 2, 'NursenaYener', 'Bir Tek Düşüncem Sensin', 'Yine her akşam gibi, bu akşam da yalnızım\r\nYine her akşam gibi, bu akşam da yalnızım\r\nMasamda tek başıma, durmadan içiyorum\r\nBir tek düşüncem sensin, seni düşünüyorum\r\nHep seni arıyorum\r\nBir tek düşüncem sensin, seni düşünüyorum\r\nHep seni arıyorum\r\nŞu an yanımda olsan, sana neler söylerdim\r\nŞu an yanımda olsan, sana neler söylerdim\r\nKafam hafif dumanlı, her derdimi dökerdim\r\nBiraz ümidim olsa, ömür boyu beklerdim\r\nÖmür boyu beklerdim\r\nBiraz ümidim olsa, ömür boyu beklerdim\r\nÖmür boyu beklerdim\r\nSesin hep kulağımda, fakat yoksum yanımda\r\nSesin hep kulağımda, fakat yoksum yanımda\r\nDediler ki aşıksın, ben buna inanmadım\r\nSana olan aşkımı, sen gidince anladım\r\nSen gidince anladım\r\nSana olan aşkımı, sen gidince anladım\r\nSen gidince anladım\r\nŞu an yanımda olsan, sana neler söylerdim\r\nŞu an yanımda olsan, sana neler söylerdim\r\nKafam hafif dumanlı, her derdimi dökerdim\r\nBiraz ümidim olsa, ömür boyu beklerdim\r\nÖmür boyu beklerdim, ömür boyu beklerdim', '', '2025-12-15', '/music/nursenayener_bir_tek_dusuncem_sensin.mp3', '/pictures/nursenayener_bir_tek_dusuncem_sensin_cov'),
(59, 2, 'NursenaYener', 'Galata', 'Kadehin dibini vurunca dostlar masaya\r\nGönlümün sokaklarında kandiller yanar\r\nMuhabbet demini salınca hafiften havaya\r\nGözlerim gözlerini felaketimi arar\r\nŞimdi galatada bir meyhanede\r\nAklım o zat-ı şahanede\r\nDostlar gönlümü eyler boşa\r\nArtık kalmadı bir bahane de\r\nŞans ne gezer divanede\r\nOnca içtik meyler boşa\r\nSonsuz bir akşam üstü şimdi\r\nHasret gitmez çakıldı kaldı semaya\r\nCanımın canı gönlümü kahret\r\nGitme müptela etme cefaya\r\nSonsuz bir akşam üstü şimdi\r\nGitmez çakıldı kaldı semaya\r\nCanımın canı gönlümü kahret\r\nGitme müptela etme cefaya\r\nKadehin dibini vurunca dostlar masaya\r\nGönlümün sokaklarında kandiller yanar\r\nMuahbbet demini salınca hafiften havaya\r\nGözlerim gözlerini felaketimi arar\r\nŞimdi galatada bir meyhanede\r\nAklım o zat-ı şahanede\r\nDostlar gönlümü eyler boşa\r\nArtık kalmadı bir bahane de\r\nŞans ne gezer divanede\r\nOnca içtik meyler boşa\r\nSonsuz bir akşam üstü şimdi\r\nHasret gitmez çakıldı kaldı semaya\r\nCanımın canı gönlümü kahret\r\nGitme müptela etme cefaya\r\nSonsuz bir akşam üstü şimdi\r\nHasret gitmez çakıldı kaldı semaya\r\nCanımın canı gönlümü kahret\r\nGitme müptela etme cefaya, cefaya, cefaya', '', '2025-12-15', '/music/nursenayener_galata.mp3', '/pictures/nursenayener_galata_cover.png'),
(60, 2, 'NursenaYener', 'Kendime Yalan Söyledim', 'Terk edilmiş bir şehrin ortasındayım\r\nAltım çamur, üstüm yağmur ama bak bur\'dayım\r\nBazı şeyler kaybetmeden sevilmiyor\r\nBedenim bur\'da fakat ruhum kabul etmiyor\r\nAh-ah-ah\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var\r\nYaşadığım ne varsa ben seçtim, ben istedim\r\nArtık sabah uyandığım ses annem değil\r\nBazı şeyler kaybetmeden fark edilmiyor\r\nBedenim bur\'da fakat ruhum kabul etmiyor\r\nAh-ah-ah\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var\r\nSer verip sır vermedim\r\nCesaret ister böyle itiraflar\r\nSöylemesi zor\r\nTek korkum bu kadar\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var', '', '2025-12-15', '/music/nursenayener_kendime_yalan_soyledim.mp3', '/pictures/nursenayener_kendime_yalan_soyledim_cove'),
(61, 2, 'NursenaYener', 'Seni Severdim', 'Yazık ne mazi yazık, anlatmaya yoruldum\r\nSen benden vaz geçnce, ben o gün de vuruldum\r\nYazık günah ben oysa, kardelen gibi\r\nAcıyla boy veren gibi\r\nSeni severdim, hüznün koynunda\r\nSeni severdim, hem uyanık, hem uykumda\r\nSeni severdim, ve sana rağmen\r\nYine severdim, dar ağacı ip boynumda\r\nSen aşkı anlamaz bilmez, gül yansa ağlamaz sakin\r\nBen akmayan göz yaşında, seni severdim\r\nSen hisli korkak savaşçı, aşkı kime satmış hain\r\nBen her savaş meydanında, seni severdim\r\nYazık ah mazi yazık bir yalnızlık, bir vurgun\r\nSen benden vaz geçince, ben o gün de vuruldum\r\nYazık günah ben oysa, pervane gibi\r\nAteşle can veren gibi\r\nSeni severdim, hüznün koynunda\r\nSeni severdim, hem uyanık, hem uykumda\r\nSeni severdim, ve sana rağmen\r\nYine severdim, dar ağacı ip boynumda\r\nSen aşkı anlamaz bilmez, gül yansa ağlamaz sakin\r\nBen akmayan göz yaşında, seni severdim\r\nSen hisli korkak savaşçı, aşkı kime satmış hain\r\nBen her savaş meydanında, seni severdim\r\nSen aşkı anlamaz bilmez, gül yansa ağlamaz sakin\r\nBen akmayan göz yaşında, seni severdim\r\nSen hisli korkak savaşçı, aşkı kime satmış hain\r\nBen her savaş meydanında, seni severdim\r\nSeni severdim', '', '2025-12-15', '/music/nursenayener_seni_severdim.mp3', '/pictures/nursenayener_seni_severdim_cover.png'),
(62, 2, 'NursenaYener', 'Unuttun mu Beni', 'Unuttun mu beni, her şeyimi?\r\nSildin mi bütün izlerimi?\r\nHiç düşmedim mi aklına?\r\nHiç çalmadı mı o şarkı?\r\nO sahil, o ev, o ada\r\nO kırlangıç da mı küs bana?\r\n\r\nSanırdım ki aşklar ancak\r\nFilmlerde böyle...\r\n\r\nBen hâlâ dolaşıyorum avare\r\nHani görsen, enikonu divane\r\nNe yaptıysam olmadı, ne çare\r\nUnutamadım, gitti!\r\n\r\nEy aşk! Neredesin şimdi?\r\nSen de mi terk ettin beni?\r\nNe hata ettiysem, affet!\r\nBüyüklük sende kalsın, e mi\r\nSen de olmazsan eğer,\r\nBatar artık bu gemi\r\n \r\nBen hâlâ dolaşıyorum avare\r\nHani görsen, enikonu divane\r\nNe yaptıysam olmadı, ne çare\r\nUnutamadım, gitti!\r\n', '', '2025-12-15', '/music/nursenayener_unuttun_mu_beni.mp3', '/pictures/nursenayener_unuttun_mu_beni_cover.png'),
(63, 2, 'NursenaYener', 'Vaçgeçtim', 'Vazgeçtim gözlerinden\r\nVazgeçtim sözlerinden\r\nBir ah de yeter\r\nSessizce, kimsesizce gönderdim dudaklarımı\r\nÖpme, al yeter\r\n\r\nHiç tanımaz tenim ellerini\r\nBilmez yüreğim bilmez yüreğini\r\n\r\nAh bu koku, bu ten, bu dokunuş\r\nAh bu delilik sarsar bedenimi\r\nYok olmak anıdır şimdi ', '', '2025-12-15', '/music/nursenayener_vacgectim.mp3', '/pictures/nursenayener_vacgectim_cover.png'),
(64, 3, 'dedubluman', 'Belki', 'Omzumda işlemediğim günahlar\r\nSözlerimde riya var\r\nKederimde bir aşk\r\nGörüyor mu?\r\nBelki de yanlıştı doğrularım\r\nAşkını, sevgini sorguladım\r\nYolların kapalıydı, zorlamadım\r\nÖldürdüm çiçeğimi, yaşatamadım\r\nDuyamadım, gidişin sessizdi\r\nBilemem ki ben yarın\r\nSessizce döner misin?\r\nSanmam ki\r\nBelki de yanlıştı doğrularım\r\nAşkını, sevgini sorguladım\r\nYolların kapalıydı zorlamadım\r\nÖldürdüm çiçeğimi, yaşatamadım', '', '2025-12-15', '/music/dedubluman_belki.mp3', '/pictures/dedubluman_belki_cover.png'),
(65, 3, 'dedubluman', 'Bir İhtimal Halim', 'Öyle bir illet ki bu içimdeki\r\nAh bile bile çekerim\r\nAnlatamam hiç kimselere de tek laf\r\nYaprak dökerim\r\nBir ihtimal halim\r\nYak ki o kül olsun sebebim\r\nYükseklerde sallanıp ateşlerde boğulacağım\r\nÖmürlerden geçip sonunda birinde kaybolacağım\r\nBir ihtimal halim\r\nYak ki o kül olsun sebebim', '', '2025-12-15', '/music/dedubluman_bir_İhtimal_halim.mp3', '/pictures/dedubluman_bir_İhtimal_halim_cover.png'),
(66, 3, 'dedubluman', 'Bunca Yıl', 'Maviler saçına düşer\r\nToprağı kanatır\r\nBudanır kanatların\r\nAnlaşılmaz bunca yıl nasıl\r\nRüzgara kapıldığın\r\nAşk benim tenimi çalıp\r\nKorkağı yaratır\r\nIslanır yanaklarım\r\nAnlaşılmaz bunca yıl nasıl\r\nNehrine kapıldığım\r\nBunca yıl sen\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden\r\nAğlasam gücüne gider\r\nKol geren limanın uzanır halatların\r\nAnlaşılmaz bunca yıl nasıl\r\nDiplere batmadığım\r\nAğrılar şekeri olur kor gibi acının\r\nKül olur soğukların\r\nAnlaşılmaz bunca yıl nasıl\r\nGüneşe aldandığın\r\nBunca yıl sen\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden\r\nYaşamaksızın dünya halini\r\nNedir bu yıldızlara merakın\r\nAdını bilmeden meşhur dip sahafların\r\nSolu tozunu, soluk sayfa dolu rafların\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden\r\nYaprak gibi dökül kadehe\r\nUyku gibi dökül gözümden\r\nSu gibi yaşa, kar gibi yağ\r\nDağ gibi kaç benden', '', '2025-12-15', '/music/dedubluman_bunca_yil.mp3', '/pictures/dedubluman_bunca_yil_cover.png'),
(67, 3, 'dedubluman', 'Çözemezsin', 'Ölüm gibi bir gün\r\nDudağımda zehir gibi\r\nFüsun değil mi bu?\r\nBaşka türlü mümkün değil\r\nHayır, bu defa başka\r\nÇözemezsin yok, bu düğüm kördür\r\nBak şu gönül tutuşuyor yine son birkaç gündür\r\nÇürüyoruz bak, nefretimi gömdüm\r\nBil ki bugün yanıyor, soluyor ömrüm\r\nUyan, uyan dedim uyanmazsan bahar ölür\r\nSarıl, sarıl dedim sarılmazsan adam ölür\r\nHayır, bu defa başka\r\nÇözemezsin yok, bu düğüm kördür\r\nKorkmuyorum gecelerden, beni sen öldür\r\nÇürüyorum bak, nefretini gördüm\r\nBil ki bugün yanıyor, soluyor ömrüm', '', '2025-12-15', '/music/dedubluman_cozemezsin.mp3', '/pictures/dedubluman_cozemezsin_cover.png'),
(68, 3, 'dedubluman', 'Dağılma (Ben De Özledim)', '', '', '2025-12-15', '/music/dedubluman_dagilma_(ben_de_ozledim).mp3', '/pictures/dedubluman_dagilma_(ben_de_ozledim)_cove'),
(69, 3, 'dedubluman', 'Düğün', 'Sorarmış solmuş biz iki yaprak\r\nKalamayız o dalda\r\nGidiyorum, durdursun gücü varsa\r\nİnadına, inadına\r\nBi\' de düğününe çağır, tam olurum be, gacı\r\nDenedik o yolu, beceremez bi\'kaçı\r\nKadehimi şerefine, bitişine vururum\r\nMasada bi\' yanım, bi\' de hanım bulurum\r\nBu huyumdur, kurusun, bu gurur aslım\r\nOlamam hemhâl yerde\r\nSövüyorum, sustursun gözü yerse\r\nÖlüşüne, sevişine\r\nBi\' de düğününe çağır, tam olurum be, gacı\r\nDenedik o yolu, beceremez bi\'kaçı\r\nKadehimi şerefine, bitişine vururum\r\nMasada bi\' yanım, bi\' de hanım bulurum', '', '2025-12-15', '/music/dedubluman_dugun.mp3', '/pictures/dedubluman_dugun_cover.png'),
(70, 3, 'dedubluman', 'Fikrimin İnce Gülü', 'Fikrimin ince gülü\r\nKalbimin şen bülbülü\r\nO gün ki gördüm seni\r\nyaktın ah yaktın beni\r\n \r\nGördüğüm günden beri\r\nOlmuşun inan deli\r\nO gün ki gördüm seni\r\nyaktın ah yaktın beni\r\n \r\nAteşli dudakların\r\nGamzeli yanakların\r\nO gün ki gördüm seni\r\nyaktın ah yaktın beni\r\n\r\n', '', '2025-12-15', '/music/dedubluman_fikrimin_İnce_gulu.mp3', '/pictures/dedubluman_fikrimin_İnce_gulu_cover.png'),
(71, 3, 'dedubluman', 'Gamzedeyim Deva Bulmam', 'Hey, hey\r\nHey, hey, hey, hey, hey, hey, hey, hey\r\nGamzedeyim, deva bulmam\r\nGaribim, hiç yuva kurmam\r\nGamzedeyim, deva bulmam\r\nGaribim, hiç yuva kurmam\r\nKaderimdir hep çektiğim\r\nİnlerim, hiç reha bulmam\r\nKaderimdir hep çektiğim\r\nİnlerim, hiç reha bulmam\r\nHey, hey\r\nHey, hey, hey, hey, hey, hey, hey, hey\r\nElem beni terk etmiyor\r\nHiç de fasıla vermiyor\r\nElem beni terk etmiyor\r\nHiç de fasıla vermiyor\r\nNihayetsiz bu takibe\r\nDoğrusu ömür yetmiyor\r\nNihayetsiz bu takibe\r\nDoğrusu ömür yetmiyor', '', '2025-12-15', '/music/dedubluman_gamzedeyim_deva_bulmam.mp3', '/pictures/dedubluman_gamzedeyim_deva_bulmam_cover.'),
(72, 3, 'dedubluman', 'Günü Gelir', 'Günü gelir, seni de yakar bir söz ya da bir göz\r\nAnlamadın\r\nBitiverir\r\nDaha çok vakit varken, mümkünken\r\nAnlamadan\r\nDudağında ismimi duydum\r\nEllerinde bir güldüm soldum\r\nİstiyorsa onun olsun\r\nBir gün için bir ömür ziyan oldum\r\nTanıyorum bakışındaki makus, sana mahsus vazgeçişi\r\nYazılmamış\r\nYazabilir miyiz dersin?\r\nBir hikaye bizim için\r\nDudağında ismimi duydum\r\nEllerinde bir güldüm soldum\r\nİstiyorsa onun olsun\r\nBir gün için bir ömür ziyan oldum\r\nBeni alsın yerlere vursun\r\nSoğuyana kadar içi, beni yorsun\r\nKaçamam ki kokusundan\r\nNe olursa olsun, dizinde son bulsun', '', '2025-12-15', '/music/dedubluman_gunu_gelir.mp3', '/pictures/dedubluman_gunu_gelir_cover.png'),
(73, 3, 'dedubluman', 'Karar Verdim', 'Görüyordum, duyuyordum, biliyordum, susuyordum\r\nİstemedim, neden \"Hayır\" diyemedim ki?\r\nKızıyordum, kaçıyordum, köşelerde yaşıyordum\r\nSöyleyecek sözüm çoktu, neden sustum ki?\r\nBenim kendimle ufak bi\' sorunum var\r\nİçimde patlamaya hazır bi\' bomba var\r\n\r\nBen bu gece karar verdim kuş olup gökte uçmaya\r\nSevdiğimi, kızdığımı dünyaya haykırmaya\r\nHa, ha, ah, ah, dünyaya haykırmaya\r\nHa, ha, ah, ah, sessizliği bozmaya\r\n\r\nPuslu puslu duruyordum, uslu uslu yaşıyordum\r\nAçıklarda yüzmenin tam zamanı şimdi\r\nHep bi\' sebep buluyordum, uzaktan seyrediyordum\r\nNe varsa tutuklu bende bıraktım gitti\r\nBenim kendimle ufak bi\' sorunum var\r\nBiriktirdiğim ne varsa şimdi patlar\r\n\r\nBen bu gece karar verdim kuş olup gökte uçmaya\r\nSevdiğimi, kızdığımı dünyaya haykırmaya\r\nHa, ha, ah, ah, dünyaya haykırmaya\r\nHa, ha, ah, ah, sessizliği bozmaya', '', '2025-12-15', '/music/dedubluman_karar_verdim.mp3', '/pictures/dedubluman_karar_verdim_cover.png'),
(74, 3, 'dedubluman', 'Kimseye Etmem Şikayet', 'Kimseye etmem şikayet, ağlarım ben halime\r\nKimseye etmem şikayet, ağlarım ben halime\r\nTitrerim mücrim gibi, baktıkça istikbalime\r\nTitrerim mücrim gibi, baktıkça istikbalime\r\nPerde i zulmet çekilmiş, korkarım ikbalime\r\nPerde i zulmet çekilmiş, korkarım ikbalime\r\nTitrerim mücrim gibi, baktıkça istikbalime\r\nTitrerim mücrim gibi, baktıkça istikbalime', '', '2025-12-15', '/music/dedubluman_kimseye_etmem_sikayet.mp3', '/pictures/dedubluman_kimseye_etmem_sikayet_cover.p'),
(75, 3, 'dedubluman', 'Sakladğığn Bir Şeyler Var', 'Kayıp bir şeyler var aramızda\r\nBilmediğim halde ziyadesiyle mahvolmuş derin bir hal içindeyim\r\nİçindeyim\r\nO kadar kolay değil bu\r\nSakladığın hep bir şeyler var\r\nEllerini kaçır tamam ama\r\nGözlerinde ayrılıklar\r\nO kadar ucuz değil bu\r\nO gün de susmuştun ve yüzünde bilmediğim bir sen\r\nBirikmiş, sanki dert olmuş gibi sana vazgeçmişsin\r\nVazgeçmişsin\r\nO kadar kolay değil bu\r\nSakladığın hep bir şeyler var\r\nEllerini kaçır tamam ama\r\nGözlerinde ayrılıklar\r\nO kadar ucuz değil bu', '', '2025-12-15', '/music/dedubluman_sakladgign_bir_seyler_var.mp3', '/pictures/dedubluman_sakladgign_bir_seyler_var_cov'),
(76, 3, 'dedubluman', 'Sana Güvenmiyorum', 'Yüzündeki izler, bana sorarsan eğer\r\nFütursuz olmanın bedeli olmalı\r\nYaşlı gözlerin, titreyen ellerin\r\nGünahkâr olmanın diyeti olmalı\r\n\r\nKimine dar, kimine yâr bu sevda\r\nTükettik bunu da daha başında\r\nKimine yâr, bana dar bu sevda\r\nBunu da söyledim sana başında\r\n\r\nYeminler etsen, \"Allah biliyor\" desen\r\nİçini görüyorum, sana güvenmiyorum\r\nYağmur bu, yağar diner, gücenen varsa gider\r\nSebebim aynı, sana güvenmiyorum\r\n\r\nYüzündeki izler, bana sorarsan eğer\r\nFütursuz olmanın bedeli olmalı\r\nYaşlı gözlerin, titreyen ellerin\r\nGünahkâr olmanın diyeti olmalı\r\n\r\nKimine dar, kimine yâr bu sevda\r\nTükettik bunu da daha başında\r\nKimine yâr, bana dar bu sevda\r\nBunu da söyledim sana başında\r\n\r\nYeminler etsen, \"Allah biliyor\" desen\r\nİçini görüyorum, sana güvenmiyorum\r\nYağmur bu, yağar diner, gücenen varsa gider\r\nSebebim aynı, sana güvenmiyorum\r\nYeminler etsen, \"Allah biliyor\" desen\r\nİçini görüyorum, sana güvenmiyorum\r\nYağmur bu, yağar diner, gücenen varsa gider\r\nSebebim aynı, sana güvenmiyorum', '', '2025-12-15', '/music/dedubluman_sana_guvenmiyorum.mp3', '/pictures/dedubluman_sana_guvenmiyorum_cover.png'),
(77, 4, 'Sertab Erener', 'Alaturka', 'Gece inerken söner perde perde gurubun rengi\r\nDerken başlar semada saltanat\r\nBen ağlarım gülerken\r\n\r\nMehtap uyanmış\r\nSeyr-ü sefada yıldızlar\r\nSiyaha yanmış\r\nBende fasıl fasıl dert\r\nAh, o ne zalim bir yarmış\r\n\r\nÇalsın sazlar, çalsın bu gece\r\nAlâturka başlasın\r\nVur usta tamburun tellerine\r\nHanendeler çağlasın\r\n\r\nÇalsın sazlar, çalsın bu gece\r\nAlâturka başlasın\r\nVur usta tamburun tellerine\r\nHanendeler çağlasın\r\n\r\nPenceremden geçer sandallarla sevdalılar hercai\r\nÇınlar gökkubbede aşkın şahane saz semai\r\n\r\nMehtap uyanmış\r\nSeyr-ü sefada yıldızlar\r\nSiyaha yanmış\r\nBende fasıl fasıl dert\r\nAh, o ne zalim bir yarmış', '', '2025-12-15', '/music/sertab_erener_alaturka.mp3', '/pictures/sertab_erener_alaturka_cover.png'),
(78, 5, 'Anonim', 'Ali Dayı', '', '', '2025-12-15', '/music/anonim_ali_dayi.mp3', '/pictures/anonim_ali_dayi_cover.png'),
(79, 5, 'Anonim', 'Bahçe Duvarından Aştım', 'Bahça duvarından aştım\r\nBahça duvarından aştım\r\nSarmaşık güllere dolaştım\r\nSarmaşık güllere dolaştım\r\n\r\nÖptüm sevdiğim halelleştim\r\nÖptüm sevdiğim halelleştim\r\nYanıyorum yanıyorum yanıyorum ele\r\nBayır oldum gonca güle\r\nAcem şalın ince bele\r\n\r\nBir bakışta yaktın beni\r\nBir bakışta yaktın beni\r\nDerdinen bıraktın beni\r\nDerdinen bıraktın beni\r\n\r\nYaktın beni yaktın beni\r\nYaktın beni yaktın beni\r\nYanıyorum yanıyorum yanıyorum ele\r\nBayır oldum gonca güle\r\nAcem şalın ince bele\r\n\r\nYeter naz eyleme bana\r\nYeter naz eyleme bana\r\nGel göreyim kana kana\r\nGel göreyim kana kana', '', '2025-12-15', '/music/anonim_bahce_duvarindan_astim.mp3', '/pictures/anonim_bahce_duvarindan_astim_cover.png'),
(80, 5, 'Anonim', 'Dede', '', '', '2025-12-15', '/music/anonim_dede.mp3', '/pictures/anonim_dede_cover.png'),
(81, 5, 'Anonim', 'Delalım', 'Diyarbekir yoluna le Diyarbekir yoluna\r\nToydum düştüm toruna le toydum düştüm toruna\r\nBu sevdalar boşuna le bu sevdalar boşuna\r\n\r\nDelalım delalım delalım delalım delalım\r\nBu sevdalar boşuna le bu sevdalar boşuna\r\nDelalım delalım delalım delalım delalım\r\n\r\nSiverek sularına le siverek sularına\r\nBak gözümün yaşına le bak gözümün yaşına\r\nBu sevdalar boşuna le bu sevdalar boşuna\r\n\r\nDelalım delalım delalım delalım delalım\r\nBu sevdalar boşuna le bu sevdalar boşuna\r\nDelalım delalım delalım delalım delalım\r\n\r\nGazi köşkü bahçalar le gazi köşkü bahçalar\r\nYar oturmuş saz çalar le yar oturmuş saz çalar\r\nDelalın kaşı gözü le ciğerimi parçalar\r\n\r\nDelalım delalım delalım delalım delalım\r\nDelalın kaşı gözü le ciğerimi parçalar\r\nDelalım delalım delalım delalım delalım', '', '2025-12-15', '/music/anonim_delalim.mp3', '/pictures/anonim_delalim_cover.png');
INSERT INTO `muzikler` (`MuzikID`, `SanatciID`, `SanatciAdi`, `SarkiAdi`, `SarkiSozleri`, `Uzunluk`, `Tarih`, `UrlToken`, `pictures`) VALUES
(82, 5, 'Anonim', 'Erik Dalı', 'Erik dalı gevrektir\r\nErik dalı gevrektir\r\nAmanın basmaya gelmez\r\nHaydi basmaya gelmez\r\nElin gızı naziktir\r\nEl gızı naziktir\r\nAmanın küsmeye gelmez\r\nHaydi küsmeye gelmez\r\nEller oynasın eller\r\nDiller oynasın diller\r\nEller ne derlerse desinler\r\nO dillerini yesinler\r\nAmanın oynasın eller\r\nDiller oynasın diller\r\nEller ne derlerse desinler\r\nO dillerini yesinler\r\nErik dalı gevrektir\r\nErik dalı gevrektir\r\nAmanın eğmeye gelmez\r\nHaydi eğmeye gelmez\r\nEl gızı naziktir\r\nEl gızı naziktir\r\nAmanın değmeye gelmez.\r\nHaydi değmeye gelmez.\r\nEller oynasın eller\r\nDiller söylesin diller\r\nEller ne derlerse desinler\r\nO dillerini yesinler\r\nAmanın oynasın eller\r\nDiller oynasın eller\r\nEller ne derlerse desinler\r\nO dillerini yesinler\r\nTatlıdır ama serttir\r\nAnkaramız başkenttir\r\nTatlıdır ama serttir\r\nAnkaramız başkenttir\r\nAslını inkar edip\r\nSöylemeyen namerttir\r\nAslını inkar edip\r\nSöylemeyen namerttir\r\nÖyle diyon böyle diyon\r\nDerdin nedir söylemiyon\r\nZambaramı Zumbaramı\r\nSendemi oldun Ankaralı\r\nÖyle diyon böyle diyon\r\nDerdin nedir söylemiyon\r\nZambaramı Zumbaramı\r\nSendemi oldun Ankaralı\r\nAnkaramın kalesi\r\nMisketiyle sillesi\r\nAnkaramın kalesi\r\nHüdaydayla sillesi\r\nNede güzel geliyor\r\nKaşık sesi zil sesi\r\nPek de güzel geliyor\r\nKaşık sesi zil sesi\r\nÖyle diyon böyle diyon\r\nDerdin nedir söylemiyon\r\nZambaramı Zumbaramı\r\nSendemi oldun Ankaralı\r\nÖyle diyon böyle diyon\r\nDerdin nedir söylemiyon\r\nZambaramı Zumbaramı\r\nSenderi oldun Ankaralı\r\nFistanı biçtim dar geldi huriyem\r\nFistanı biçtim dar geldi huriyem\r\nHastalandim yar geldi boyama\r\nHastalandim yar geldi boyama\r\nŞamamada küçük hanim Şamama\r\nŞamamada küçük hanim Şamama\r\nHergün gider sinemaya hamama\r\nHergün gider sinemaya hamama\r\nGeldiyse yarim geldi huriyem\r\nGeldiyse yarim geldi huriyem\r\nBaşıma neler geldi boyama\r\nAh başıma neler geldi boyama\r\nŞamamada küçük hanim Şamama\r\nŞamamada küçük hanim Şamama\r\nHergün gider sinemaya hamama\r\nHergün gider sinemaya hamama', '', '2025-12-15', '/music/anonim_erik_dali.mp3', '/pictures/anonim_erik_dali_cover.png'),
(83, 5, 'Anonim', 'Korkak', 'Dünden beri\r\nİçimde bir sıkıntı yokluyor beni\r\nAnlıyorum, yakmışsın gemileri\r\nSeviyordum, biliyordun ve gidiyordun\r\nGeri alabilmek mümkün olsa her şeyi\r\nİnandırmaz mıydım aşka seni?\r\nHem seni hem o taş kalbini\r\n\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nKorkaksın\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nSen bi′ korkaksın\r\n\r\nDünden beri\r\nİçimde bir sıkıntı yokluyor beni\r\nAnlıyorum, yakmışsın gemileri\r\nSeviyordum, biliyordun ve gidiyordun\r\nGeri alabilmek mümkün olsa her şeyi\r\nİnandırmaz mıydım aşka seni?\r\nHem seni hem o taş kalbini\r\n\r\nGökhan Türkmen & Aslı Demirer\r\nGökhan Türkmen\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nKorkaksın\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nSen bi\' korkaksın\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nSen bi′ korkaksın\r\nGider mi insan çok seviyorken?\r\nŞimdi, \"Dur\" demem\r\nNasıl olsa bir gün anlar\r\nBeni anlarsın\r\nYalanlarla bırakma beni böyle\r\nGözlerime bak, doğruyu söyle\r\nAma korkak\r\nSen bi\' korkaksın ', '', '2025-12-15', '/music/anonim_korkak.mp3', '/pictures/anonim_korkak_cover.png'),
(84, 5, 'Anonim', 'Para Bizde', 'Para bizde\r\nŞöhret bizde\r\nDüşmanlarla yarışırız para çok para çok\r\nMankenlerle yarışırız güzeliz çok çok\r\nBütün gözler üstümüzde çekemeyen çok çok\r\nFiyakalı arabamız var havamız çok\r\nPara bizde, şöhret bizde\r\nSizde ne var haydi söyle\r\nHayat bizde, herşey bizde\r\nSizde ne var haydi söyle\r\nÇakallarla yarışırız para çok para çok\r\nSosyeteye karışırız kaliteyiz çok çok\r\nAilemiz zirvede markayız çok çok\r\nBomba gibi geliyoruz gezeriz çok\r\nPara bizde, şöhret bizde\r\nSizde ne var söyle, söyle\r\nHayat bizde, herşey bizde\r\nSizde ne var haydi söyle\r\nPara bizde, şöhret bizde\r\nSizde ne var söyle, söyle\r\nHayat bizde, herşey bizde\r\nSizde ne var haydi söyle\r\nÇek saksafoncu çek, çek, çek, çek\r\nPara bizde, şöhret bizde\r\nSizde ne var söyle, söyle\r\nHayat bizde, herşey bizde\r\nSizde ne var haydi söyle\r\nPara bizde, şöhret bizde\r\nSizde ne var söyle, söyle\r\nHayat bizde, herşey bizde\r\nSizde ne var haydi söyle\r\nPara bizde', '', '2025-12-15', '/music/anonim_para_bizde.mp3', '/pictures/anonim_para_bizde_cover.png'),
(85, 5, 'Anonim', 'Xantini Tabancası', '', '', '2025-12-15', '/music/anonim_xantini_tabancasi.mp3', '/pictures/anonim_xantini_tabancasi_cover.png'),
(86, 5, 'Anonim', 'Ya Ben Anlatamadum', 'Ay vurur ayan beyan, geldum kapına yayan\r\nSen değil misun beni ha bu hallere koyan\r\nAy dedun aya geldum, sana sevdaya geldum\r\nRize\'den İstanbula, yürüdüm yayan geldum\r\nAy vurur ayan beyan, geldum kapına yayan\r\nSen değil misun beni, ha bu hallere koyan\r\nAy dedun aya geldum, sana sevdaya geldum\r\nRize\'den İstanbula, yürüdüm yayan geldum\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldum, bana damlamayısun\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldum, bana damlamayısun\r\nElumde çiçeklerum, çoktur diyeceklerum\r\nAç kapıyı sevdiğum, yoktur gidecek yerum\r\nBoylarına bakarum, saçına gül takarım\r\nKız senun gülüşüne, İstanbulu yakarum\r\nElumde çiçeklerum, çoktur diyeceklerum\r\nAç kapıyı sevdiğum, yoktur gidecek yerum\r\nBoylarına bakarum, saçına gül takarım\r\nKız senun gülüşüne, İstanbulu yakarum\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldun, bana damlamayisun\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldun, bana damlamayisun\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldum, bana damlamayısun\r\nYa ben anlatamadum, ya sen anlamayisun\r\nEllere yağmur oldum, bana damlamayısun', '', '2025-12-15', '/music/anonim_ya_ben_anlatamadum.mp3', '/pictures/anonim_ya_ben_anlatamadum_cover.png'),
(87, 6, 'Semincek', 'Çıkmaz Bir Sokakta', 'Çıkmaz bir sokakta, aklımda sen\'le\r\nDizlerim titriyor, içimde hasret\r\nGözlerim doluyor sen bilmesen de\r\nBu deli gönlüme \"Dur\" diyemiyorum\r\nÇıkmaz bir sokakta, aklımda sen\'le\r\nDizlerim titriyor, içimde hasret\r\nGözlerim doluyor sen bilmesen de\r\nBu deli gönlüme \"Dur\" diyemiyorum\r\nBir nefes, bir adım ve ben\'le fel\r\nYandın öyle ama dayan gönlüm, etme pes\r\nSözlerin yetmiyor ki dinlesin\r\nSessiz ol, sevdiğini bilmesin\r\nYanan ateşi söndürmeden gel\r\nGözlerimde küçülmeden\r\nKırılan kalp körelmeden gel\r\nSabrım beni döndürmeden\r\nYanan ateşi söndürmeden gel\r\nGözlerimde küçülmeden\r\nKırılan kalp körelmeden gel\r\nSabrım beni döndürmeden\r\nAvare gönlüm rüyalarda elbet yer bulacak\r\nGeceler bizim olacak, kadehler küllerle dost olacak\r\nÇıkmaz bir sokakta, aklımda sen\'le\r\nDizlerim titriyor, içimde hasret\r\nGözlerim doluyor sen bilmesen de\r\nBu deli gönlüme \"Dur\" diyemiyorum\r\nÇıkmaz bir sokakta, aklımda sen\'le\r\nDizlerim titriyor, içimde hasret\r\nGözlerim doluyor sen bilmesen de\r\nBu deli gönlüme \"Dur\" diyemiyorum', '', '2025-12-15', '/music/semincek_cikmaz_bir_sokakta.mp3', '/pictures/semincek_cikmaz_bir_sokakta_cover.png'),
(88, 7, 'Model', 'Bir Pazar Kahvaltısı', 'Uyurken izliyorum en sevdiğim hâlini\r\nSaçların dağınık, yüzünde yastık izi\r\nBir pazar kahvaltısı gibi\r\nKüçük oyunlarının, büyük savaşlarının\r\nArasında olduğu kadar bi\' aşktı bizimkisi\r\nBir pazar gecesi uykusu gibi\r\n\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\n\r\nUyurken izliyorum en sevdiğim hâlini\r\nSaçların dağınık, yüzünde yastık izi\r\nBir pazar kahvaltısı gibi\r\nKüçük oyunlarının, büyük savaşlarının\r\nArasında olduğu kadar bi\' aşktı bizimkisi\r\nBir pazar gecesi uykusu gibi\r\n\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\n\r\nBitmesi gerek artık\r\nAnlıyoruz ikimiz de\r\nO zaman neden hâla\r\nAğlıyoruz ikimiz de?\r\n\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi\r\nNe yaparsam olmuyor\r\nOlmuyor eskisi gibi\r\nGüldürmüyor, ağlatmıyor\r\nKimse senin gibi', '', '2025-12-15', '/music/model_bir_pazar_kahvaltisi.mp3', '/pictures/model_bir_pazar_kahvaltisi_cover.png'),
(89, 7, 'Model', 'Değmesin Ellerimiz', 'Ah ne zormuş bitsin demek\r\nHala severken seni\r\nDudaklarını öpmemek\r\nBir yabancı gibi\r\nBilirsin ayrılık konusunda\r\nİyi değiliz ikimiz de\r\nBir kıvılcım yeterdi her zaman\r\nKoşup geri dönmemize\r\nDeğmesin ellerimiz\r\nBuluşmasın bu gözler\r\nYine erir gideriz\r\nUnutulur yeminler\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nAşk kokan dudakların\r\nKarşısında direnmeyi de\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nAşk dolu mısraların\r\nKarşısında direnmeyi de\r\nAh ne zormuş bitsin demek\r\nHala severken seni\r\nDudaklarını öpmemek\r\nBir yabancı gibi\r\nBilirsin ayrılık konusunda\r\nİyi değiliz ikimiz de\r\nBir kıvılcım yeterdi her zaman\r\nKoşup geri dönmemize\r\nDeğmesin ellerimiz\r\nBuluşmasın bu gözler\r\nYine erir gideriz\r\nUnutulur yeminler\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nAşk kokan dudakların\r\nKarşısında direnmeyi de\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nAşk dolu mısraların\r\nKarşısında direnmeyi de\r\nİşte bir kez daha\r\nDurup karşında\r\nBelki de son defa\r\nSoruyorum sana\r\nBitti mi hikayemiz?\r\nBu ne biçim son böyle\r\nDeğmez miydi sevgimiz\r\nSavaşıp direnmeye?\r\nDeğmesin ellerimiz\r\nBuluşmasın bu gözler\r\nYine erir gideriz\r\nUnutulur yeminler\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nKendimize sahip çıkıp\r\nDünyayla yüzleşmeyi de\r\nBiz hiç beceremedik\r\nSevmeyi de terk etmeyi de\r\nKorktuğumuz o gözlerin\r\nKarşısında direnmeyi de\r\nBitmesin hikayemiz', '', '2025-12-15', '/music/model_degmesin_ellerimiz.mp3', '/pictures/model_degmesin_ellerimiz_cover.png'),
(90, 7, 'Model', 'Mey', 'Bakması ne zormuş, ah, o güzel yüzüne\r\nToplamış yine bütün güneşi üstüne\r\nKamaşıyor gözlerim, bebeğim\r\nÖyle gülmek olur mu gözünü seveyim?\r\nCennet dudaklarınmış, öp de öleyim\r\nAşkmış adı, ner\'den bileyim?\r\nBöyle zulüm olur mu gözünü seveyim?\r\nAdımı sorsan söyleyemem, yemin ederim\r\n(Yemin ederim)\r\nAh, ellerim titriyor\r\nOf, bi\' ateş basıyor\r\nÖzlemek bu, dokunmakla geçmiyor\r\nAh, öyle sev ki beni (doldur, sevgilim)\r\n(Yaramaz kalbimi)\r\nMey diye içeyim (doldur, sevgilim)\r\nKalbim tekliyor, ah, gel, hasta gibiyim\r\nBakması ne zormuş, ah, o güzel yüzüne\r\n(O güzel yüzüne)\r\nToplamış yine bütün güneşi üstüne\r\n(Güneşi üstüne)\r\nKamaşıyor gözlerim, bebeğim\r\nBöyle gülmek olur mu gözünü seveyim?\r\nCennet dudaklarınmış, öp de öleyim\r\nAşkmış adı, ner\'den bileyim?\r\nBöyle zulüm olur mu gözünü seveyim?\r\nAdımı sorsan söyleyemem, yemin ederim\r\n(Yemin ederim)\r\nAh, ellerim titriyor\r\nOf, bi\' ateş basıyor\r\nÖzlemek bu, dokunmakla geçmiyor\r\nAh, öyle sev ki beni (doldur, sevgilim)\r\n(Yaramaz kalbimi)\r\nMey diye içeyim (doldur, sevgilim)\r\nKalbim tekliyor, ah, gel, hasta gibiyim\r\nAh, ellerim titriyor (ah, ellerim titriyor)\r\nOf, bi\' ateş basıyor (of, bi\' ateş basıyor)\r\nÖzlemek bu, dokunmakla geçmiyor (özlemek bu, dokunmakla geçmiyor)\r\nAh, öyle sev ki beni\r\nMey diye içeyim\r\nKalbim tekliyor, ah, gel, hasta gibiyim\r\nAh, ellerim titriyor\r\nOf, bi\' ateş basıyor\r\nÖzlemek bu, dokunmakla geçmiyor\r\nAh, öyle sev ki beni (doldur, sevgilim)\r\n(Yaramaz kalbimi)\r\nMey diye içeyim (doldur, sevgilim)\r\nKalbim tekliyor, ah, gel, hasta gibiyim', '', '2025-12-15', '/music/model_mey.mp3', '/pictures/model_mey_cover.png'),
(91, 8, 'yirmi7', 'Muhtemel Aşk', 'Muhtemel aşk icin\r\nAştım bendimi\r\nYolculuk nereye?\r\nDinlemeden kendimi\r\nAh\r\nMuhtemelen aşk\r\nBir anda çocuk oldum\r\nSaklandı kederlerim\r\nYumdum gözlerimi\r\nSana açtım kendimi\r\nAh\r\nMuhtemelen aşk\r\nOf\r\nMuhtemel aşk için\r\nVirane oldum\r\nBir anı aşk ömrüme\r\nDivane oldu\r\nMuhtemel aşk için\r\nVirane oldum, aman aman\r\nBir anı aşk ömrüme\r\nDivane oldu\r\nAh\r\nMuhtemelen aşk\r\nHiç canım acımadan\r\nÂşık oldum sandım\r\nDikenlerin üstünde\r\nBir tebessüm yüzümde\r\nAh\r\nMuhtemelen aşk\r\nOf\r\nMuhtemel aşk için\r\nVirane oldum\r\nBir anı aşk ömrüme\r\nDivane oldu\r\nMuhtemel aşk için\r\nVirane oldum, aman aman\r\nBir anı aşk ömrüme\r\nDivane oldu\r\nAh\r\nMuhtemelen aşk\r\nOf\r\nMuhtemel aşk için\r\nVirane oldum, aman aman\r\nBir anı aşk ömrüme\r\nDivane oldu', '', '2025-12-15', '/music/yirmi7_muhtemel_ask.mp3', '/pictures/yirmi7_muhtemel_ask_cover.png'),
(92, 9, 'Uzi', 'Şarkılar Sokaklara Ait', 'İstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim\r\nKorkma, sıkıntı yok ya, sorun benim, tamam\r\nBi\' yokla sol tarafı, hissettin mi ruha ait tek bi\' nota? Sanmam\r\nNeden kayıp gitti rotan?\r\nBizi neden erteledin, neden bağlandın bi\' psikopata?\r\nYaşa, tüm hisleri tat\r\nKötü bütün anıları hemen silip at\r\nYa da siktir et, kaliteli kal\r\nÜstümdeki enerjiyi bendеn geri al\r\nBeni sana anlatmaktan, inan, hiç yorulmadım\r\nÇok mu mutluyum ki uçurumun kenarındayım?\r\nKеndimi kaybettim ve çok farkındayım\r\nBunu ikimiz için başarmak zorundayım\r\nBöyle içten güler miydin? Çaldın vaktim yokken\r\nBaktım o yok, derdim yok ama sanki daha güzel varken\r\nDöküldüyse gerçekten saf cümlelerin kalpten\r\nArtık buluşmalı tüm âşıklar henüz sağken\r\nİstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim\r\nAktı 20 sene bi\' gün bile \"Dur\" demeden\r\nAnılar yaşanıp dönüştü dövmelerime\r\nAteş gibiydim, bu soğukta sönmedim yine\r\nKatlandı bedenim anılara, dövmelerine\r\nSen\'le birlikte vazgeçmeliyim şehirden\r\nBi\' aşkım sen, bi\' aşkım o, ne yapmalıyız şimdi biz?\r\nArkasında kaldık yanında düşlediklerimizin\r\nBeşiktaş\'ı kaçıncı turlayışımız hep birlikte\r\nPembe manzaralar çünkü yaşam siyah beyaz\r\nTersodaydım hep, bilirsin, ayakkabım yeni biraz\r\nSorumluluklarım kan içinde geçen bi\' yaz\r\nSenin omuzların benim yüklerimi sırtlayamaz\r\n(İstedim hayatına dâhil olmayı\r\n(Ve beni uzaklaştırdın, bi\' hainsin)\r\n(Benim kalmadı mecalim\r\n(Yerden bakınca anladım, gökyüzüne sahipmişsin)\r\nİstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim', '', '2025-12-15', '/music/uzi_sarkilar_sokaklara_ait.mp3', '/pictures/uzi_sarkilar_sokaklara_ait_cover.png'),
(93, 10, 'Motive', 'Şarkılar Sokaklara Ait', 'İstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim\r\nKorkma, sıkıntı yok ya, sorun benim, tamam\r\nBi\' yokla sol tarafı, hissettin mi ruha ait tek bi\' nota? Sanmam\r\nNeden kayıp gitti rotan?\r\nBizi neden erteledin, neden bağlandın bi\' psikopata?\r\nYaşa, tüm hisleri tat\r\nKötü bütün anıları hemen silip at\r\nYa da siktir et, kaliteli kal\r\nÜstümdeki enerjiyi bendеn geri al\r\nBeni sana anlatmaktan, inan, hiç yorulmadım\r\nÇok mu mutluyum ki uçurumun kenarındayım?\r\nKеndimi kaybettim ve çok farkındayım\r\nBunu ikimiz için başarmak zorundayım\r\nBöyle içten güler miydin? Çaldın vaktim yokken\r\nBaktım o yok, derdim yok ama sanki daha güzel varken\r\nDöküldüyse gerçekten saf cümlelerin kalpten\r\nArtık buluşmalı tüm âşıklar henüz sağken\r\nİstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim\r\nAktı 20 sene bi\' gün bile \"Dur\" demeden\r\nAnılar yaşanıp dönüştü dövmelerime\r\nAteş gibiydim, bu soğukta sönmedim yine\r\nKatlandı bedenim anılara, dövmelerine\r\nSen\'le birlikte vazgeçmeliyim şehirden\r\nBi\' aşkım sen, bi\' aşkım o, ne yapmalıyız şimdi biz?\r\nArkasında kaldık yanında düşlediklerimizin\r\nBeşiktaş\'ı kaçıncı turlayışımız hep birlikte\r\nPembe manzaralar çünkü yaşam siyah beyaz\r\nTersodaydım hep, bilirsin, ayakkabım yeni biraz\r\nSorumluluklarım kan içinde geçen bi\' yaz\r\nSenin omuzların benim yüklerimi sırtlayamaz\r\n(İstedim hayatına dâhil olmayı\r\n(Ve beni uzaklaştırdın, bi\' hainsin)\r\n(Benim kalmadı mecalim\r\n(Yerden bakınca anladım, gökyüzüne sahipmişsin)\r\nİstedim hayatına dâhil olmayı\r\nVe beni uzaklaştırdın, bi\' hainsin\r\nBenim kalmadı mecalim\r\nYerden bakınca anladım, gökyüzüne sahipmişsin\r\nŞarkılar sokaklara ait\r\nAma bu bi\' ilk ve sen ilklere sahipmişsin\r\nSolan çiçeklerim mavi\r\nBedenim benimle 20 senedir ve sadık kalbim', '', '2025-12-15', '/music/motive_sarkilar_sokaklara_ait.mp3', '/pictures/motive_sarkilar_sokaklara_ait_cover.png'),
(94, 2, 'NursenaYener', 'Kendime Yalan Söyledim', 'Terk edilmiş bir şehrin ortasındayım\r\nAltım çamur, üstüm yağmur ama bak bur\'dayım\r\nBazı şeyler kaybetmeden sevilmiyor\r\nBedenim bur\'da fakat ruhum kabul etmiyor\r\nAh-ah-ah\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var\r\nYaşadığım ne varsa ben seçtim, ben istedim\r\nArtık sabah uyandığım ses annem değil\r\nBazı şeyler kaybetmeden fark edilmiyor\r\nBedenim bur\'da fakat ruhum kabul etmiyor\r\nAh-ah-ah\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var\r\nSer verip sır vermedim\r\nCesaret ister böyle itiraflar\r\nSöylemesi zor\r\nTek korkum bu kadar\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nKendime yalan söyledim\r\nYalnızım, bunu ben istedim\r\nParamparça bütün aynalar\r\nİçinde kan revan birisi var\r\nBirisi var\r\nBirisi var', '', '2025-12-15', '/music/nursenayener_kendime_yalan_soyledim.mp3', '/pictures/nursenayener_kendime_yalan_soyledim_cove');

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
(10, 16, 81, 3),
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
  MODIFY `MuzikID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

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
