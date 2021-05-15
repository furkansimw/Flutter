import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



/// 34.Satir
/// sdk: flutter
/// path_provider: ^2.0.1    => BU EKLENECEK 
/// pubspec.yaml dosyasinda :)
/// guncel versiyon icin pub Upgrade dememiz gerek
/// 17.04.2021
/// 

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sayfa1(),
    );
  }
}

class Sayfa1 extends StatefulWidget {
  @override
  _Sayfa1State createState() => _Sayfa1State();
}

var tfgirdi = TextEditingController();

class _Sayfa1State extends State<Sayfa1> {


  Future<void> VeriYaz() async {  
    var ad = await getApplicationDocumentsDirectory();
    var uygulamadosyayolum = ad.path;
    var dosya = File("$uygulamadosyayolum/dosyam.txt");

    dosya.writeAsString(tfgirdi.text);//okuma islemi

    tfgirdi.text = "";  // inputtaki veriyi  bos belirlendi 
  }

  Future<void> VeriOku() async {//veriyi okuma
    try {//burada %100 dogru bir eylem olmadigi icin try da yazliliyor hata alirsak diye
      var ad = await getApplicationDocumentsDirectory(); // ad ismiyle dosyalara erisim komudu
      var uygulamadosyayolum = ad.path;//uygulamayolum adiyla dosyalara erisim komudunu kullanarak path(yol olusturduk dosya yolu)

      var dosya = File("$uygulamadosyayolum/dosyam.txt");//dosya ismi ile dosya olusturuldu=>uygulamadosyayolum/dosyam.txt ' e

      String okunanVeri = await dosya.readAsString();  // dosyayi okurma islemi

      tfgirdi.text = okunanVeri;  // input girdisinin yazisini okunan veriye esitlendi
    } catch (e) {//egerki calismazise tekrar calistir dedik  
      return e.toString();
    }
  }

  Future<void> VeriSil() async {
    var ad = await getApplicationDocumentsDirectory();  //ad ismiyle bir dosya izni istendi 
    var uygulamadosyayolum = ad.path;   // uygulamadosyayolum ismi ile yol olustu

    var dosya = File("$uygulamadosyayolum/dosyam.txt"); // dosya olustur >> (dosyam.txt)

    if (dosya.existsSync()) {//eger cikis yapilirsa sil
      dosya.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: tfgirdi,
                decoration: InputDecoration(hintText: "Veri Giriniz"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Text("Yaz"),
                    onPressed: () {
                      VeriYaz();
                    }),
                RaisedButton(
                    child: Text("Oku"),
                    onPressed: () {
                      VeriOku();
                    }),
                RaisedButton(
                    child: Text("Sil"),
                    onPressed: () {
                      VeriYaz();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
