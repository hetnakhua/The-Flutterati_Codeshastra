class ForumPostEntry{
  final String username;
  final String time;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry({
    required this.username,
    required this.time,
    required this.likes,
    required this.dislikes,
    required this.text
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'time': time,
    'likes': likes,
    'dislikes': dislikes,
    'text': text
  };
}
