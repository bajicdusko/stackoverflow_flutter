import 'dart:async';

import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';
import 'package:first_flutter_app/domain/UseCase.dart';
import 'package:first_flutter_app/domain/repository/StackOverflowRepository.dart';

class GetTaggedQuestions extends UseCase<StackOverflowQuestion>{

  final StackOverflowRepository _soRepository;

  GetTaggedQuestions(this._soRepository);

  @override
  Future<Stream<StackOverflowQuestion>> build(List<String> filters) {
    return _soRepository.getAndroidQuestions(filters);
  }
}