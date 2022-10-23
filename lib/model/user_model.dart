class User {
  final String id;
  final String name;
  final String image;
  final String firebaseId;
  final String token;
  final DateTime tokenExpiration;
  User({
    required this.id,
    required this.name,
    required this.image,
    required this.firebaseId,
    required this.token,
    required this.tokenExpiration,
  });
}
