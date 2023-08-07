class UserListModel {
  String? id;
  String? title;
  String? lastname;
  String? firstname;
  String? picture;

  UserListModel(
      {required this.id,
      required this.title,
      required this.lastname,
      required this.firstname,
      required this.picture});

  factory UserListModel.fromMap(Map<String, dynamic> json) => UserListModel(
      id: json['id'],
      title: json['title'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      picture: json['picture']);
}
