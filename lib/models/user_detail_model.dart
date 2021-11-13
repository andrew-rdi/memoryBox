// class UserDetailModel {
//   String uid;
//   String displayName;
//   String providerId;
//   Timestamp creationTime;
//   Timestamp lastSignInTime;
//   Timestamp lastFeedback;

//   UserDetailModel({
//     required this.uid,
//     required this.displayName,
//     required this.providerId,
//     this.creationTime,
//     this.lastSignInTime,
//     this.lastFeedback,
//   });

//   factory UserDetailModel.fromJson(Map<String, dynamic> json) {
//     return UserDetailModel(
//       uid: json['uid'],
//       displayName: json['displayName'],
//       providerId: json['providerId'],
//       creationTime: json['creationTime'],
//       lastSignInTime: json['lastSignInTime'],
//       lastFeedback: json['lastFeedback'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'uid': uid,
//     'displayName': displayName,
//     'providerId': providerId,
//     'creationTime': creationTime,
//     'lastSignInTime': lastSignInTime,
//     'lastFeedback': lastFeedback,
//   };
// }