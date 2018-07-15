import 'package:first_flutter_app/app/home/FilterWidget.dart';
import 'package:first_flutter_app/app/home/HomeWidget.dart';
import 'package:first_flutter_app/app/question/QuestionList.dart';
import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';
import 'package:first_flutter_app/presentation/HomePresenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeState extends State<HomeWidget> implements HomeView {

  HomePresenter _homePresenter;
  List<StackOverflowQuestion> questions = [];

  HomeState(){
    _homePresenter = HomePresenter();
    _homePresenter.setView(this);
  }

  @override
  void initState() {
    super.initState();
    _homePresenter.loadQuestions();
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
            QuestionList(questions)
          ],
        ),
      ),
    );
  }

  @override
  onAddQuestion(StackOverflowQuestion question) {
    setState(() {
      if (!questions.contains(question)) {
        questions.insert(0, question);
      }
    });
  }

  @override
  onErrorOccurred(Object error, StackTrace stackTrace) {
    print(error.toString());
    if(stackTrace != null){
      print(stackTrace);
    }
  }

  @override
  onLoadingCompleted() {
    print("Questions loading completed");
  }

  showFilterScreen() {
    Navigator
        .push(context, MaterialPageRoute(builder: (context) => FilterWidget()))
        .then((value) => _homePresenter.loadQuestions());
  }
}
