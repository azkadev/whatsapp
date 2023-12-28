// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

class WhatsAppBotApi {
  String token_bot = "";
  Uri url_wa_bot_api = Uri.parse("http://0.0.0.0:9990/api");
  bool is_invoke_throw_on_error = true;
  Client http_client = Client();
  WhatsAppBotApi({
    required String tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) {
    token_bot = tokenBot;
    if (httpClient != null) {
      http_client = httpClient;
    }
    if (urlWaBotApi != null) {
      url_wa_bot_api = urlWaBotApi;
    }
    if (isInvokeThrowOnError != null) {
      is_invoke_throw_on_error = isInvokeThrowOnError;
    }
  }

  Future<Map> invokeRaw({
    required String method,
    required Map? parameters,
    String? tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) async {
    httpClient ??= http_client;
    isInvokeThrowOnError ??= is_invoke_throw_on_error;
    urlWaBotApi ??= url_wa_bot_api;
    parameters ??= {};
    tokenBot ??= token_bot;
    parameters["@type"] = method;
    parameters["@token"] = tokenBot;
    String body = json.encode(parameters);
    Response response = await httpClient.post(
      urlWaBotApi,
      headers: {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      body: body,
    );
    dynamic data_result = (json.decode(response.body));

    Map result = {};
    if (data_result is Map) {
      result = data_result;
    } else if (data_result is List) {
      result["result"] = data_result;
    }
    if (response.statusCode != 200) {
      if (isInvokeThrowOnError) {
        throw result;
      }
    }
    return result;
  }

  Future<Map> invoke({
    required String method,
    Map? parameters,
    String? tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) async {
    return await invokeRaw(
      method: method,
      parameters: parameters,
      tokenBot: tokenBot,
      urlWaBotApi: urlWaBotApi,
      isInvokeThrowOnError: isInvokeThrowOnError,
      httpClient: httpClient,
    );
  }

  Future<Map> request({
    required String method,
    Map? parameters,
    String? tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) async {
    return await invoke(
      method: method,
      parameters: parameters,
      tokenBot: tokenBot,
      urlWaBotApi: urlWaBotApi,
      isInvokeThrowOnError: isInvokeThrowOnError,
      httpClient: httpClient,
    );
  }
}
