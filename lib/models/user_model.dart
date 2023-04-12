class User {
  String name;
  String username;
  String email;
  String? avatar;

  User({
    required this.name,
    required this.username,
    required this.email,
    this.avatar
  });
}