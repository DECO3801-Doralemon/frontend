class User {
  final String imagePath;
  final String name;
  final int followers;
  final int likes;
  final int waste_percentage;
  final String email;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.followers,
    required this.likes,
    required this.waste_percentage,
    required this.email,
    required this.about,
  });

  User copy({
    String? imagePath,
    String? name,
    int? followers,
    int? likes,
    int? waste_percentage,
    String? email,
    String? about,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        followers: followers ?? this.followers,
        likes: likes ?? this.likes,
        waste_percentage: waste_percentage ?? this.waste_percentage,
        email: email ?? this.email,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        followers: json['followers'],
        likes: json['likes'],
        waste_percentage: json['waste_percentage'],
        email: json['email'],
        about: json['about'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'followers': followers,
        'likes': likes,
        'waste_percentage': waste_percentage,
        'email': email,
        'about': about,
      };
}
