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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'package:whatsapp_client/whatsapp_client/whatsapp_client.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_data.dart';

/// update telegram data
class UpdateWhatsAppClient {
  /// 
  final Map rawData;
  /// 
  final Map query;
  /// 
  final Uri uri;
  /// 
  final Map client_option;
/// 
  final WhatsAppClientData whatsappClientData;
  /// 
  final WhatsAppClient wa;
  /// 
  const UpdateWhatsAppClient({
    required this.rawData,
    required this.uri,
    required this.query,
    required this.client_option,
    required this.whatsappClientData,
    required this.wa,
  });
/// 
  Map tgClientData() {
    if (whatsappClientData.whatsAppClientType ==
        WhatsAppClientType.whats_app_bot_api) {
      return wa.whatsAppBotApi.waClientData(query: query).rawData;
    }
    return client_option;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> updateRaw({
    required bool is_lite,
    required UpdataOptionWhatsAppClient updataOptionWhatsAppClient,
  }) async {
    if (whatsappClientData.whatsAppClientType ==
        WhatsAppClientType.whats_app_bot_api) {
      return rawData;
    }

    return null;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update_lite async {
    return await updateRaw(
      is_lite: true,
      updataOptionWhatsAppClient: UpdataOptionWhatsAppClient(
        updataMessageWhatsAppClient: UpdataMessageWhatsAppClient(),
      ),
    );
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update async {
    return await updateRaw(
      is_lite: false,
      updataOptionWhatsAppClient: UpdataOptionWhatsAppClient(
        updataMessageWhatsAppClient: UpdataMessageWhatsAppClient(),
      ),
    );
  }
}

/// 
class UpdataOptionWhatsAppClient {
  /// 
  final UpdataMessageWhatsAppClient updataMessageWhatsAppClient;
  /// 
  UpdataOptionWhatsAppClient({
    required this.updataMessageWhatsAppClient,
  });
}
/// 
class UpdataMessageWhatsAppClient {
  /// 
  final bool bot_is_skip_old_message;
  /// 
  final bool user_is_skip_old_message;
  /// 
  late final Duration duration_old_message_skip;
  /// 
  late final List<String> skip_old_chat_types;
  /// 
  UpdataMessageWhatsAppClient({
    this.bot_is_skip_old_message = false,
    this.user_is_skip_old_message = true,
    Duration? durationOldMessageSkip,
    List<String>? skipOldChatTypes,
  }) {
    durationOldMessageSkip ??= Duration(seconds: 10);
    skipOldChatTypes ??= ["group", "supergroup", "channel"];

    duration_old_message_skip = durationOldMessageSkip;
    skip_old_chat_types = skipOldChatTypes;
  }
}
