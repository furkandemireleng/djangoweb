class BildirimData {
  int id;
  String title;
  String endpoint;
  String content;
  bool done;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "endpoint": endpoint,
      "content": content,
      "done": done == true ? 1 : 0
    };
  }

  BildirimData({
    this.id,
    this.title,
    this.endpoint,
    this.content,
    this.done,
  });

  BildirimData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    endpoint = map['endpoint'];
    content = map['content'];
    done = map['done'] == 1;
  }
}
