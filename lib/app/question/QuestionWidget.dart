import 'package:flutter/material.dart';

const double DEFAULT_MARGIN = 16.0;
const double SMALL_MARGIN = 8.0;

class QuestionWidget extends StatelessWidget {
  final String title;
  final String author;
  final String avatar;

  QuestionWidget(this.title, this.author, this.avatar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SMALL_MARGIN, horizontal: DEFAULT_MARGIN),
      child: Row(
        children: <Widget>[
          _buildCircleAvatar(),
          Flexible(
              child: Container(
                  margin: EdgeInsets.only(left: DEFAULT_MARGIN),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[_buildTitle(), _buildAuthorName()],
                  ))),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange,
      backgroundImage: NetworkImage(avatar),
      radius: 24.0,
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      maxLines: 2,
    );
  }

  Text _buildAuthorName() {
    return Text(author);
  }
}
