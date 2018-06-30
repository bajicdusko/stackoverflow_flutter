import 'package:first_flutter_app/app/home/HomeWidget.dart';
import 'package:first_flutter_app/app/question/QuestionList.dart';
import 'package:first_flutter_app/app/ui/BlueButton.dart';
import 'package:first_flutter_app/data/model/SoQuestion.dart';
import 'package:first_flutter_app/data/repository/SoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeState extends State<HomeWidget> {
  StackOverflowRepository apiRepo = ApiSoRepository();
  List<StackOverflowQuestion> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("StackOverflow Questions"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          QuestionList(questions),
          BlueButton("Reload", clickFn),
        ],
      )),
    );
  }

  void clickFn() {
    loadQuestions();
  }

  loadQuestions() async {
    var resStream = await apiRepo.getAndroidQuestions();
    resStream.listen((question) => setState(() {
          if (!questions.contains(question)) {
            questions.insert(0, question);
          }
        }));
  }
}
