class UserDetailModel {
  String? id;
  String? title;
  String? firstname;
  String? lastname;
  String? picture;
  String? gender;
  String? email;
  String? dateOfBirth;
  String? phone;
  String? street;
  String? city;
  String? state;
  String? country;
  String? timeZone;
  UserDetailModel(
      {required this.id,
      required this.title,
      required this.firstname,
      required this.lastname,
      required this.picture,
      required this.gender,
      required this.phone,
      required this.city,
      required this.country,
      required this.dateOfBirth,
      required this.email,
      required this.state,
      required this.street,
      required this.timeZone});

  factory UserDetailModel.fromMap(Map<String, dynamic> json) => UserDetailModel(
      id: json['id'],
      title: json['title'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      picture: json['picture'],
      gender: json['gender'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      phone: json['phone'],
      street: json['location']['street'],
      city: json['location']['city'],
      state: json['location']['state'],
      country: json['location']['country'],
      timeZone: json['location']['timezone']);
}
