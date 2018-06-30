import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String title;
  final String author;
  final String avatar;

  QuestionWidget(this.title, this.author, this.avatar);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepOrange,
        backgroundImage: NetworkImage(avatar),
        radius: 24.0,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      subtitle: Text(author),
    );
  }
}
