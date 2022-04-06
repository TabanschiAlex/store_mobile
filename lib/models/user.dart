class User {
  final String uuid;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt
});
}