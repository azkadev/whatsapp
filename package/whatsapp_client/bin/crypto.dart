/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

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
import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  print(generateUuid(32));
  Crypto crypto = Crypto(key: "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb");

  var envrypt = crypto.encrypt(data: "sasaa");
  print(envrypt);
  var dnvrypt = crypto.decrypt(
      data_base64:
          "NBChYjW1gR2qnZtXr9XvD12VBmfdKra87zKxV4zai2vK1jzs60e3d4K+YiXbZWoolRn4QjtCp9QvLFNIINuUGPmux1QjEbmvEn9roSJxyOXJygrctYGV6KsvHKAcLJiSw9sauFSwuSbBPzc/Gw4DZ+sxrwHr2T2BeMebgrGIHSIiZnpbTvWx41LdKif413tuGJdt1tdV9qrVw2yVvM6IdNtO9WI5qBRO0PYC1ydgg3RAekM0j2g/3nCfw5Q1Pad2S3AaPIcHV2n9OKWmyDAcew/6TemEuSQbxWjow05Jaf4/x1YSnzMixAOkH9nInVs3");
  print(dnvrypt);
}
