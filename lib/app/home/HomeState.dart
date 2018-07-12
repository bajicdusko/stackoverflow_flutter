import 'package:first_flutter_app/app/home/FilterWidget.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => showFilterScreen(),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            QuestionList(questions),
            BlueButton("Reload", clickFn),
          ],
        ),
      ),
    );
  }

  void clickFn() {
    loadQuestions();
  }

  loadQuestions() async {
    print("Loading questions.");
    var resStream = await apiRepo.getAndroidQuestions(activeFilters);
    questions.clear();
    resStream.listen((question) => setState(() {
          if (!questions.contains(question)) {
            questions.insert(0, question);
          }
        }));
  }

  showFilterScreen() {
    Navigator
        .push(context, MaterialPageRoute(builder: (context) => FilterWidget()))
        .then((value) => loadQuestions());
  }
}
