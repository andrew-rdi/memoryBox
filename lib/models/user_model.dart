class UserModel {
  final String uid;
  final String displayName;
  final String providerId;
  final int avatar;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.providerId,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      displayName: json['displayName'],
      providerId: json['providerId'],
       avatar: json['Avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'providerId': providerId,
  };

}


// class UserModel {
//   String uid;
//   String displayName;
//   String avatarUrl;

//   UserModel(this.uid, {required this.displayName, required this.avatarUrl});
// }