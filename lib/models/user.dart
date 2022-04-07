class User {
  final String uuid;
  final String name;
  final String email;
  final String token;

  const User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(uuid: json['user']['uuid'],
        name: json['user']['name'] ?? 'user',
        email: json['user']['email'],
        token: json['token']);
  }
}