import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_defteri/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ozelsayfa extends StatefulWidget {
  @override
  _ozelsayfaState createState() => _ozelsayfaState();
}

var sifrex;
bool oturum = false;
var _tf1 = TextEditingController();
var _tf2 = TextEditingController();
bool eye = true;
var _cache_sifre = null;

class _ozelsayfaState extends State<ozelsayfa> {
  @override
  void initState() {
    setState(() {
      _cache_sifre = null;
      _tf1.text = '';
      _tf2.text = '';
      hesapolusturma = false;
    });
    super.initState();
  }

  hesapkaydi() {
    FirebaseFirestore.instance
        .collection(_tf1.text)
        .doc('kisisel bilgiler')
        .set({"sifre": _tf2.text});
    FirebaseFirestore.instance
        .collection(_tf1.text)
        .doc('kisisel bilgiler')
        .update({"isim": _tf1.text});
  }

  String hesapsorgu() {
    FirebaseFirestore.instance
        .collection(_tf1.text)
        .doc('kisisel bilgiler')
        .get()
        .then((value) {
      setState(() {
        _cache_sifre = value.data()["sifre"] ?? null;
        return _cache_sifre;
      });
    });
  }

  void hesapAyrintilar() {
    setState(() {
      isimx = _tf1.text;
      sifrex = _tf2.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    var genis = screen.size.width;
    var yukseklik = screen.size.height;
    final kullaniciAdiHatasi = SnackBar(
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              _tf1.text = '';
              _tf2.text = '';
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ozelsayfa()));
            }),
        content: Text(
          'Bu Kullanici Adi Kullaniliyor \nLutfen Baska bir kullanici adi seciniz!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
    final hesapolusturuldu = SnackBar(
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              _tf1.text = '';
              _tf2.text = '';
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ozelsayfa()));
            }),
        content: Text(
          'hesap olusturma basarili :)',
          style: TextStyle(fontSize: 22, color: Colors.red),
        ));
    final basarili = SnackBar(
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              _tf1.text = '';
              _tf2.text = '';
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ozelsayfa()));
            }),
        content: Text(
          'Oturum Basari Ile Acildi :)',
          style: TextStyle(fontSize: 20),
        ));
    final sifreyanlis = SnackBar(
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              _tf1.text = '';
              _tf2.text = '';
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ozelsayfa()));
            }),
        content: Text(
          'Hatali Bilgiler!',
          style: TextStyle(fontSize: 20, color: Colors.redAccent),
        ));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AnaSayfa()));
          },
        ),
        title: oturum
            ? Text('Hosgeldiniz $isimx')
            : Text(
                'Oturum aciniz!',
                style: TextStyle(fontSize: genis / 24),
              ),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screen.size.height / 25),
              Visibility(
                visible: !oturum,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        hesapolusturma
                            ? 'Hesap Olusturuluyor'
                            : 'Giris Yapiliyor',
                        style: TextStyle(
                            fontSize: screen.size.width / 25,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: screen.size.height / 20),
                      SizedBox(
                        width: screen.size.width / 1.2,
                        child: TextField(
                          controller: _tf1,
                          style: TextStyle(
                              fontSize: genis / 30, color: Colors.green),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.people,
                              size: genis / 20,
                            ),
                            labelText: hesapolusturma
                                ? 'kullanici adi olustur'
                                : 'kullanici adi giriniz',
                            labelStyle: TextStyle(fontSize: genis / 35),
                            hintStyle: TextStyle(fontSize: genis / 35),
                            helperText: 'Zorunlu',
                            helperStyle: TextStyle(color: Colors.red),
                            counterText: 'en az 6 haneli',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screen.size.height / 30,
                      ),
                      SizedBox(
                        width: screen.size.width / 1.2,
                        child: TextField(
                          controller: _tf2,
                          obscureText: eye,
                          style: TextStyle(
                              fontSize: genis / 30, color: Colors.orange),
                          decoration: InputDecoration(
                            icon: Icon(Icons.stars, size: genis / 20),
                            suffix: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                size: genis / 25,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {
                                setState(() {
                                  eye = !eye;
                                });
                              },
                            ),
                            labelText: hesapolusturma
                                ? 'sifre olustur'
                                : 'sifrenizi giriniz',
                            labelStyle: TextStyle(fontSize: genis / 35),
                            hintStyle: TextStyle(fontSize: genis / 35),
                            helperText: 'Zorunlu',
                            helperStyle: TextStyle(color: Colors.red),
                            counterText: 'en az 4 haneli',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screen.size.width / 1.65,
                            top: screen.size.height / 30),
                        child: SizedBox(
                            width: screen.size.width / 6,
                            height: screen.size.height / 27,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (hesapolusturma) {
                                    hesapsorgu();
                                    if (_cache_sifre == null) {
                                      hesapkaydi();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(hesapolusturuldu);
                                      setState(() {
                                        oturum = true;
                                        hesapAyrintilar();
                                        _cache_sifre = null;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(kullaniciAdiHatasi);
                                    }
                                  } else {
                                    hesapsorgu();
                                    if (_cache_sifre == _tf2.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(basarili);
                                      setState(() {
                                        oturum = true;

                                        hesapAyrintilar();
                                        _cache_sifre = null;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(sifreyanlis);
                                      setState(() {
                                        _cache_sifre = null;
                                      });
                                    }
                                  }
                                },
                                child: Text(
                                  'Oturum Ac',
                                  style: TextStyle(fontSize: genis / 40),
                                ))),
                      ),
                      CupertinoButton(
                          child: Text(
                            hesapolusturma ? 'giris yap' : 'Hesap Olustur',
                            style: TextStyle(fontSize: genis / 28),
                          ),
                          onPressed: () {
                            setState(() {
                              hesapolusturma = !hesapolusturma;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: oturum,
                child: Container(
                  color: Color(0xffa9f1df),
                  width: screen.size.width / 1.1,
                  height: screen.size.height / 2.2,
                  child: Column(
                    children: [
                      Text(
                        'Oturum Acik $isimx',
                        style:
                            TextStyle(fontFamily: 'nanum', fontSize: genis / 9),
                      ),
                      Text('Toplam notlar ${notbasliklari.length}',
                          style: TextStyle(
                              fontFamily: 'nanum', fontSize: genis / 13)),
                      CupertinoButton(
                          child: Text(
                            'Cikis Yap',
                            style: TextStyle(
                                color: Colors.red, fontSize: genis / 30),
                          ),
                          onPressed: () {
                            setState(() {
                              oturum = false;
                              noticerikleri.clear();
                              notbasliklari.clear();
                              isimx = '';
                              sifrex = '';
                            });
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool hesapolusturma = true;
var isimx;
