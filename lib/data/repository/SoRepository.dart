import 'dart:async';
import 'dart:convert';

import 'package:first_flutter_app/data/model/SoQuestion.dart';
import 'package:http/http.dart' as http;

abstract class StackOverflowRepository {
  Future<Stream<StackOverflowQuestion>> getAndroidQuestions();
}

class ApiSoRepository implements StackOverflowRepository {
  @override
  Future<Stream<StackOverflowQuestion>> getAndroidQuestions() async {
    var client = http.Client();
    var url =
        "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow&pagesize=100&tagged=android";

    var response = await client.send(new http.Request("get", Uri.parse(url)));

    return response.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((json) => (json as Map)["items"])
        .map((item) => StackOverflowQuestion.fromJson(item));
  }
}
