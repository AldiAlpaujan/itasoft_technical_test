class User {
  final bool isAdmin;
  final String username;
  final String token;

  const User({
    required this.isAdmin,
    required this.username,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isAdmin: json['isAdmin'],
      username: json['username'],
      token: json['token'],
    );
  }
}
