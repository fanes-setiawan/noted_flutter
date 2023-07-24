class Note {
  final int? id;
  final String title;
  final String content;
  final DateTime createdTime;
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
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdTime: DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          map['createdTime'],
        ),
      ),
    );
  }
}
