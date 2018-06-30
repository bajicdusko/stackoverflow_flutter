import 'package:first_flutter_app/app/question/QuestionWidget.dart';
import 'package:first_flutter_app/data/model/SoQuestion.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final List<StackOverflowQuestion> questions;

  QuestionList(this.questions);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: questions
            .map((item) => QuestionWidget(item.title, item.author, item.avatar))
            .toList(),
      ),
    );
  }
}
