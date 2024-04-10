/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "client_data.dart";

 
class AuthorizationStateWaitsScanQr extends JsonScheme {

  
  AuthorizationStateWaitsScanQr(super.rawData);
   
  static Map get defaultData {
    return {"@type":"authorizationStateWaitsScanQr","qr":"","client":{"@type":"clientData","id":"","name":""}};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  String? get qr {
    try {
      if (rawData["qr"] is String == false){
        return null;
      }
      return rawData["qr"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set qr(String? value) {
    rawData["qr"] = value;
  }


  
  ClientData get client {
    try {
      if (rawData["client"] is Map == false){
        return ClientData({}); 
      }
      return ClientData(rawData["client"] as Map);
    } catch (e) {  
      return ClientData({}); 
    }
  }


  
  set client(ClientData value) {
    rawData["client"] = value.toJson();
  }



  
  static AuthorizationStateWaitsScanQr create({

    String special_type = "authorizationStateWaitsScanQr",
    String? qr,
      ClientData? client,
})  {
    // AuthorizationStateWaitsScanQr authorizationStateWaitsScanQr = AuthorizationStateWaitsScanQr({
Map authorizationStateWaitsScanQr_data_create_json = {
  
      "@type": special_type,
      "qr": qr,
      "client": (client != null)?client.toJson(): null,


};


          authorizationStateWaitsScanQr_data_create_json.removeWhere((key, value) => value == null);
AuthorizationStateWaitsScanQr authorizationStateWaitsScanQr_data_create = AuthorizationStateWaitsScanQr(authorizationStateWaitsScanQr_data_create_json);

return authorizationStateWaitsScanQr_data_create;



      }
}