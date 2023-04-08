class User {
  final String name;
  final String email;
  final String id;
  final String collegeName;
  final String dateOfBirth;

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.collegeName,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id': id,
        "dateOfBirth": dateOfBirth,
        'collegeName': collegeName,
      };
}
