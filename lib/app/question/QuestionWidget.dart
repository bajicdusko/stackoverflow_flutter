import 'package:first_flutter_app/domain/model/StackOverflowQuestion.dart';
import 'package:flutter/material.dart';

const double DEFAULT_MARGIN = 16.0;
const double SMALL_MARGIN = 8.0;

class QuestionWidget extends StatelessWidget {
  final StackOverflowQuestion _question;

  QuestionWidget(this._question);

  @override
  Widget build(BuildContext context) {
    var title = _buildTitle();
    return GestureDetector(
      onTap: () => print("Taped $title"),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SMALL_MARGIN, horizontal: DEFAULT_MARGIN),
        child: Row(
          children: <Widget>[
            _buildCircleAvatar(),
            Flexible(
                child: Container(
                    margin: EdgeInsets.only(left: DEFAULT_MARGIN),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[title, _buildAuthorName()],
                    ))),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange,
      backgroundImage: NetworkImage(_question.avatar),
      radius: 24.0,
    );
  }

  Widget _buildTitle() {
    return Text(
      _question.title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      maxLines: 2,
    );
  }

  Text _buildAuthorName() {
    return Text(_question.author);
  }
}
