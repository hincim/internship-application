import 'dart:ui';

import 'package:get/get.dart';

class Lang extends Translations {

  static final defaultLang = Locale("tr","TR");
  static final langs = [
    Locale("tr","TR"),
    Locale("en","US"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "contact_phone":"Phone",
      "address":"Address: Akademi Quarter, "
          "New Istanbul Street No: 235/1, 42250 "
          "Selçuklu/Konya",
      "ktun":"KONYA TECHNICAL UNIVERSITY",
      "ktun_sub":"Pioneer of Development",
      'splash': 'Graduate Tracking System',
      "login": "Login",
      "eng":"English",
      "turkish":"Turkish",
      "sign_up": "Sign Up",
      "psw_forgot":"I forgot my password",
      "identification_number":"Identification Number",
      "psw":"Password",
      "not_registered":"Not registered?",
      "register":"Register",
      "language_option":"Language Option",
      "phone":"Phone",
      "password_repeat":"Password Repeat",
      "check_one":"I have read the Lighting Text prepared in accordance with the Law on Protection of Personal Data No. 6698.",
      "check_two":"10 of the Law on Protection of Personal Data No. 6698. Within the scope of the lighting obligation provisions of the data officer regulated in the article, there is a clear consent to the processing and transfer of your personal data according to the information of the Lighting Text presented to you by Konya Technical University.",
      "member":"Already a member?",
      "contact":"Contact",
      "weather":"Weather",
      "my_profile":"My Profile",
      "about":"About",
      "version":"Version",
      "city":"City",
      "temperature":"Temperature",
      "sensedTemperature":"Sensed Temperature",
      "enter_city":"Enter city...",
      "logout":"Log out",
      "no_data":"No data"
    },
    'tr_TR': {
      "phone":"Telefon",
      "address":"Adres: Akademi Mahallesi, "
          "Yeni İstanbul Caddesi No: 235/1, 42250 "
          "Selçuklu/Konya",
      "ktun":"KONYA TEKNİK ÜNİVERSİTESİ",
      "ktun_sub":"Gelişimin Öncüsü",
      'splash': 'Mezun Takip Sistemi',
      "login": "Giriş Yap",
      "eng":"İngilizce",
      "turkish":"Türkçe",
      "sign_up": "Kayıt Ol",
      "psw_forgot":"Şifremi unuttum",
      "identification_number":"Vatandaşlık No",
      "psw":"Şifre",
      "not_registered":"Kayıtlı değil misin?",
      "register":"Kayıt Ol",
      "language_option":"Dil Seçeneği",
      "contact_phone":"Telefon",
      "password_repeat":"Şifre Tekrar",
      "check_one":"6698 Sayılı Kişisel Verilerin Korunması Kanunu uyarınca hazırlanan Aydınlatma Metni’ni okudum.",
      "check_two":"6698 Sayılı Kişisel Verilerin Korunması Kanunu’nun 10. maddesinde düzenlenen veri sorumlusunun aydınlatma yükümlülüğü hükümleri kapsamında veri sorumlusu sıfatıyla Konya Teknik Üniversitesi tarafından size sunulan Aydınlatma Metninin bilgilendirilmesine göre kişisel verilerinizin işlenmesi ve aktarılmasına açık rızam vardır.",
      "member":"Zaten üye misin?",
      "contact":"İletişim",
      "weather":"Hava Durumu",
      "my_profile":"Profilim",
      "about":"Hakkında",
      "version":"Versiyon",
      "city":"Şehir",
      "temperature":"Sıcaklık",
      "sensedTemperature":"Hissedilen Sıcaklık",
      "enter_city":"Şehir girin...",
      "logout":"Çıkış yap",
      "no_data":"Veri yok"
    }
  };

}