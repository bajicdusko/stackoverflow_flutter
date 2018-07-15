import 'package:first_flutter_app/app/home/FilterWidget.dart';
import 'package:first_flutter_app/data/repository/ApiStackOverflowRepository.dart';
import 'package:first_flutter_app/domain/GetTaggedQuestions.dart';
import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';
import 'package:first_flutter_app/domain/repository/StackOverflowRepository.dart';

class HomePresenter {
  GetTaggedQuestions _getQuestions;

  HomeView _view;

  HomePresenter(){
    StackOverflowRepository repository = new ApiStackOverflowRepository();
    _getQuestions = GetTaggedQuestions(repository);
  }

  void setView(HomeView view) {
    this._view = view;
  }

  void loadQuestions() async {
    var resStream = await _getQuestions.build(activeFilters);
    resStream.listen(
        (question) =>
            _view.onAddQuestion(question),
        onError: _view.onErrorOccurred,
        onDone: _view.onLoadingCompleted);
  }
}

abstract class HomeView {
  onAddQuestion(StackOverflowQuestion question);

  onErrorOccurred(Object error, StackTrace stackTrace) {}

  onLoadingCompleted() {}
}
