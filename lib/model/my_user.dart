class MyUser {
  static String collectionName = 'users';
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;

  MyUser(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email});

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] as String,
            firstName: json['firstName'] as String,
            lastName: json['lastName'] as String,
            userName: json['userName'] as String,
            email: json['email'] as String);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email
    };
  }
}
