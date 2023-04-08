class User {
  final String name;
  final String email;
  final String id;
  final String location;
  final int age;
  final String gender;
  final int phone;
  final int rating;
  final int activity_status;

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.location,
    required this.age,
    required this.gender,
    required this.phone,
    required this.rating,
    required this.activity_status,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id': id,
        'location': location,
        'age': age,
        'gender': gender,
        'phone': phone,
        'rating': rating,
        'activity_status': activity_status,
      };
}
