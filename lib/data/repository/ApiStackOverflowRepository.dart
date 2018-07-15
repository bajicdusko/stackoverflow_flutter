import 'dart:async';
import 'dart:convert';

import 'package:first_flutter_app/domain/repository/StackOverflowRepository.dart';
import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';
import 'package:http/http.dart' as http;

class ApiStackOverflowRepository implements StackOverflowRepository {
  @override
  Future<Stream<StackOverflowQuestion>> getAndroidQuestions(List<String> activeFilters) async {
    var client = http.Client();

    StringBuffer activeTagsParam = StringBuffer();
    activeTagsParam.writeAll(activeFilters, ",");

    var url = 'https://api.stackexchange.com/2.2/questions?'
        'order=desc&'
        'sort=activity&'
        'site=stackoverflow&'
        'pagesize=100&'
        'tagged=${activeTagsParam.toString()}';

    var response = await client.send(new http.Request("get", Uri.parse(url)));

    return response.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((json) => (json as Map)["items"])
        .map((item) => StackOverflowQuestion.fromJson(item));
  }
}
