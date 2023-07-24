class Note {
  final int? id;
  final String title;
  final String content;
  final String createdTime;
  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdTime': createdTime,
    };
  }
}
