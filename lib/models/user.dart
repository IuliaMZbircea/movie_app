import 'dart:convert';

class User {
  final String email;
  final String uid;

  User({
    required this.email,
    required this.uid,
  });

  factory User.fromJson(Map<String, String> json){
    return User(
      email: json['email'] as String,
      uid: json['uid'] as String,
    );
  }

  static Map<String, String> toMap(User user) => {
    'email': user.email,
    'uid': user.uid,
  };

  static String encode(User user) => json.encode(User.toMap(user));

  static User decode(String userJson) => (User.fromJson(User.toMap(json.decode(userJson))));
  
  }