import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeni_proje/sonuc_ekrani.dart';
import 'package:yeni_proje/user_data.dart';
import './gender_widget.dart';
import './my_container.dart';
import 'constants.dart';
import 'my_outlined_box.dart';
import './sonuc_ekrani.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "KADIN";
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedBox("BOY", boy),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedBox("KİLO", kilo),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Haftada kaç gün spor yapıyorsunuz?",
                            style: kMetinStili,
                          ),
                          Text(sporGunu.round().toString(), style: kSayiStili),
                          Slider(
                              value: sporGunu,
                              min: 0,
                              max: 7,
                              divisions: 7,
                              onChanged: (double newValue) {
                                setState(() {
                                  sporGunu = newValue;
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Günde kaç sigara içiyorsunuz?",
                            style: kMetinStili,
                          ),
                          Text(icilenSigara.round().toString(),
                              style: kSayiStili),
                          Slider(
                            value: icilenSigara,
                            onChanged: (double newValue) {
                              setState(() {
                                icilenSigara = newValue;
                              });
                            },
                            min: 0,
                            max: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPressed: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN"
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: GenderWidget(),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPressed: () {
                        setState(() {
                          seciliCinsiyet = "ERKEK";
                        });
                      },
                      renk: seciliCinsiyet == "ERKEK"
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: GenderWidget(
                          cinsiyet: "ERKEK",
                          cinsiyetIkonu: FontAwesomeIcons.mars),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SonucEkrani(UserData(
                          boy: boy,
                          icilenSigara: icilenSigara,
                          seciliCinsiyet: seciliCinsiyet,
                          kilo: kilo,
                          sporGunu: sporGunu))),
                );
              },
              child: Text(
                "HESAPLA",
                style: kMetinStili,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: const Size(10, 48),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowOutlinedBox(String boyKiloText, int boyKiloInt) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 8.0),
          child: RotatedBox(
            child: Text(boyKiloText, style: kMetinStili),
            quarterTurns: -1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: RotatedBox(
            child: Text(
              boyKiloInt.toString(),
              style: kSayiStili,
            ),
            quarterTurns: -1,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyOutlinedButton(
              isaret: "+",
              onPressed: () {
                setState(() {
                  if (boyKiloText == "BOY") {
                    boy++;
                  } else if (boyKiloText == "KİLO") {
                    kilo++;
                  }
                });
              },
            ),
            MyOutlinedButton(
              isaret: "-",
              onPressed: () {
                setState(() {
                  if (boyKiloText == "BOY") {
                    boy--;
                  } else if (boyKiloText == "KİLO") {
                    kilo--;
                  }
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
