class User_DM 
{
  static const collectionName = "users";
  static User_DM? currentUser;
  String id;
  String email;
  String userName;

  User_DM
  (
    {
      required this.id,
      required this.email,
      required this.userName,
    }
  );

  User_DM.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        userName = json['userName'];

  Map<String, dynamic> toJson() 
  {
    return 
    {
      'id': id,
      'email': email,
      'userName': userName,
    };
  }
}