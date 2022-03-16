import 'package:untitled50/Kisiler.dart';
import 'package:untitled50/VeritabaniYardimcisi.dart';

class kisilerdao
{

  Future <List<Kisiler>> tumKisiler () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");
    
    return List.generate(maps.length, (index){

      var satir = maps[index];

      return Kisiler(satir["kisiler_id"],satir["ad"] , satir["soyad"]);
    });
  }


  Future <void> kisiEkle (String ad, String soyad) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    var bilgiler = Map<String,dynamic>();

    bilgiler["ad"] = ad;
    bilgiler["soyad"] = soyad;

    await db.insert("kisiler", bilgiler);

  }


  Future <void> kisiSil (int kisiler_id) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

 await db.delete("kisiler",where: "kisiler_id=?",whereArgs: [kisiler_id]);

  }


  Future <void> kisiGuncelle (int kisiler_id, String ad, String soyad) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    var bilgiler = Map<String,dynamic>();

    bilgiler["ad"] = ad;
    bilgiler["soyad"] = soyad;

    await db.update("kisiler", bilgiler,where: "kisiler_id=?",whereArgs: [kisiler_id]);

  }

  Future <int> kayitKontrol ( String ad) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();


   /*
    var bilgiler = Map<String,dynamic>();
     bilgiler["ad"] = ad;
    bilgiler["soyad"] = soyad;

    await db.update("kisiler", bilgiler,where: "kisiler_id=?",whereArgs: [kisiler_id]);

    */

   List <Map<String,dynamic>> maps = await (db.rawQuery("SELECT  count(*) AS sonuc From kisiler WHERE ad='$ad'" ));
   return maps [0]["sonuc"];

  }

  Future <Kisiler> kisiGetir ( int kisi_id) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();


    /*
    var bilgiler = Map<String,dynamic>();
     bilgiler["ad"] = ad;
    bilgiler["soyad"] = soyad;

    await db.update("kisiler", bilgiler,where: "kisiler_id=?",whereArgs: [kisiler_id]);

    */

    List <Map<String,dynamic>> maps = await (db.rawQuery("SELECT * FROM kisiler WHERE kisiler_id='$kisi_id'" ));

    var satir = maps[0];

    return Kisiler(satir["kisiler_id"], satir["ad"] , satir["soyad"]);  //maps [0]["sonuc"];

  }



  Future <List<Kisiler>> kisiArama (String aramaKelimesi) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index){

      var satir = maps[index];

      return Kisiler(satir["kisiler_id"],satir["ad"] , satir["soyad"]);
    });
  }


  Future <List<Kisiler>> rasgele2kisiGetir () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2");

    return List.generate(maps.length, (index){

      var satir = maps[index];

      return Kisiler(satir["kisiler_id"],satir["ad"] , satir["soyad"]);
    });
  }

}