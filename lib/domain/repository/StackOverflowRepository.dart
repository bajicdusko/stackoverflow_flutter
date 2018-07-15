import 'dart:async';

import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';

abstract class StackOverflowRepository{
  Future<Stream<StackOverflowQuestion>> getAndroidQuestions(List<String> activeFilters);
}