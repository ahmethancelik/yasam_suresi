import 'package:yeni_proje/user_data.dart';

class Hesap {
  UserData _userData;

  Hesap(this._userData);

  int hesaplama() {
    double sonuc;

    sonuc = 90 + _userData.sporGunu - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.seciliCinsiyet == "KADIN") {
      return sonuc.toInt() + 3;
    } else {
      return sonuc.toInt();
    }
  }
}
