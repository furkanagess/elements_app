import 'package:flutter/material.dart';

@immutable
final class TrAppStrings {
  const TrAppStrings._();
  //  Genel
  static const String appName = 'Elementler ~ Öğren & Çöz';
  static const String errorMsg = 'Bir hata meydana geldi';
  static const String space = '';
  // Tüm Elementler
  static const String elements = 'Elementler';
  static const String allElements = 'Elementler';
  // Element Detay
  static const String block = 'Blok';
  static const String period = 'Periyot';
  static const String group = 'Grup';
  static const String name = 'İsim:';
  static const String number = 'Numara:';
  static const String weight = 'Ağırlık:';
  static const String description = 'Açıklama';
  static const String usage = 'Kullanım Alanı';
  static const String source = 'Kaynak';

  // Element Tipleri
  static const String actinides = 'Aktinit';
  static const String alkaline = 'Alkali Metal';
  static const String earthAlkaline = 'Toprak Alkali';
  static const String halogens = 'Halojen';
  static const String lanthanides = 'Lantanit';
  static const String metalloids = 'Metalimsi';
  static const String nobleGases = 'Soygaz';
  static const String postTransition = 'Geçiş Sonrası Metal';
  static const String reactiveNonmetal = 'Reaktif Ametal';
  static const String transitionMetal = 'Geçiş Metal';
  static const String unknown = 'Bilinmeyen';

  // Element Grupları
  static const String elementGroups = 'Element Grupları';
  static const String metalloidGroups = 'Metalimsi Grubu';
  static const String metalGroups = 'Metal Grupları';
  static const String nonMetalGroups = 'Ametal Grupları';
  static const String halogenGroups = 'Halojen Grubu';

  // Anasayfa
  static const String what = 'Nedir';
  static const String quiz = 'Test';
  static const String groups = 'Gruplar';

  // Quiz
  static const String nextQuestion = 'Sıradaki Soru';
  static const String backToQuestion = 'Soruya Dön';

  // Bilgi
  static const String elementTypes = 'Element Türleri';

  // Bağlantı
  static const String connectionError =
      'Lütfen internet bağlantınızı kontrol ediniz.';
  // Search
  static const String searchResult = 'Sonuç Bulunamadı...';
  static const String searchLabel = 'Element adı ve numarası girin...';
  // Rate
  static const String rateTitle = "Uygulamayı Değerlendirin";
  static const String rateDescription =
      "Uygulamamızı değerlendirmek için birkaç saniyenizi ayırın. Sizin düşünceleriniz bizim için çok değerli";

  // Help Popup
  static const String help1 =
      "Elementlerin renkleri, element'in yer aldığı grubu temsil etmektedir. Her bir renk farklı bir grubu temsil eder.";
  static const String help2 =
      "Elementler sayfasına giderek tüm elementler'e erişebilirsin";
  static const String help3 =
      "Nedir sayfasına giderek periyodik tablo ve elementler ile ilgili bilgiler edinebilirsin";
  static const String help4 =
      "Grup sayfasına giderek gruplarına göre elementlerin listesine erişebilirsin.";
  static const String help5 =
      "Elementlerin listendiği sayfaların altında bulunan butona tıklayarak o elementlerin quiz'ini çözebilirsin.";
}
