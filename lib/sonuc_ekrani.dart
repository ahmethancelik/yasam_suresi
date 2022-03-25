import 'package:flutter/material.dart';
import 'package:yeni_proje/constants.dart';
import 'package:yeni_proje/input_page.dart';
import 'package:yeni_proje/user_data.dart';
import 'hesap.dart';

class SonucEkrani extends StatelessWidget {
  late UserData _userData;
  SonucEkrani(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "YAŞAM BEKLENTİSİ",
          style: TextStyle(color: Colors.black54),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                "Beklenen Yaşam Süresi: ${Hesap(_userData).hesaplama()}",
                style: kMetinStili,
              ))),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            child: Text(
              "GERİ DÖN",
              style: kMetinStili,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              fixedSize: const Size(100, 50),
            ),
          ),
        ],
      ),
    );
  }
}
