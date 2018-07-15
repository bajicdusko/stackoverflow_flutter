class StackOverflowQuestion {
  int id;
  String title;
  String author;
  String avatar;
  String link;

  StackOverflowQuestion.fromJson(Map item) {
    id = item["question_id"];
    title = item["title"];
    author = (item["owner"] as Map)["display_name"];
    avatar = (item["owner"] as Map)["profile_image"];
    link = item["link"];
  }

  @override
  bool operator ==(other) {
    return other != null && (other is StackOverflowQuestion) && this.id == other.id;
  }

  @override
  int get hashCode => id;
}