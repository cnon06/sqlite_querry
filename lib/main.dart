import 'package:flutter/material.dart';
import 'package:untitled50/Kisiler.dart';
import 'package:untitled50/kisilerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  Future <void> kisilerGoster() async
  {
    var liste = await kisilerdao().tumKisiler();


    for(Kisiler k in liste)
      {
        print('Id: ${k.kisi_id} Ad: ${k.ad} Soyad: ${k.soyad}');
    }

    print('******************');
  }


  Future <void> kisiEkle() async
  {
    kisilerdao().kisiEkle("Azime", "ÇİLELİ");

    kisilerGoster();
  }

  Future <void> kisiSil() async
  {
    kisilerdao().kisiSil(4);

    kisilerGoster();
  }

  Future <void> kisiGuncelle() async
  {
    kisilerdao().kisiGuncelle(1, "Tayyar", "ÇILGIN");

    kisilerGoster();
  }

  Future <void> adKayitKontrol() async
  {

   int kayitSayisi = await kisilerdao().kayitKontrol("Tayyar");

    print('Adında $kayitSayisi adet kişi vardır');

   // kisilerGoster();
  }


  Future <void> kisiGetir() async
  {

    var kisi = await kisilerdao().kisiGetir(3) ;
    print('Id: ${kisi.kisi_id} Ad: ${kisi.ad} Soyad: ${kisi.soyad}');

  //  print('Adında $kayitSayisi adet kişi vardır');

    // kisilerGoster();
  }

  Future <void> kisiArama() async
  {
    var liste = await kisilerdao().kisiArama("y");


    for(Kisiler k in liste)
    {
      print('Id: ${k.kisi_id} Ad: ${k.ad} Soyad: ${k.soyad}');
    }

    print('******************');
  }


  Future <void> rasgeleGetir() async
  {
    var liste = await kisilerdao().rasgele2kisiGetir();


    for(Kisiler k in liste)
    {
      print('Id: ${k.kisi_id} Ad: ${k.ad} Soyad: ${k.soyad}');
    }

    print('******************');
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisilerGoster();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            ElevatedButton(onPressed: ()
                {
                  kisiEkle();
                }, child: Text("Ekle")),

            ElevatedButton(onPressed: ()
            {
              kisiSil();
            }, child: Text("Sil")),

            ElevatedButton(onPressed: ()
            {
              kisiGuncelle();
            }, child: Text("Guncelle")),

            ElevatedButton(onPressed: ()
            {
              kisilerGoster();
            }, child: Text("Kişileri Göster")),

            ElevatedButton(onPressed: ()
            {
              adKayitKontrol();
            }, child: Text("Ad Kayıt Kontrol")),


            ElevatedButton(onPressed: ()
            {
             kisiGetir();
            }, child: Text("Kişi Getir")),

            ElevatedButton(onPressed: ()
            {
              kisiArama();
            }, child: Text("Kişi Arama")),

            ElevatedButton(onPressed: ()
            {
              rasgeleGetir();
            }, child: Text("Rasgele Getir")),

          ],
        ),
      ),

    );
  }
}
