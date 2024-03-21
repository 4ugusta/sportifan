class Profile {
  int id;
  String bio;
  String username;
  String emailId;
  String phoneNumber;
  int userId;
  String status;

  Profile(this.id, this.bio, this.username, this.emailId, this.phoneNumber, this.userId, this.status);

  // Factory constructor to create a Profile object from a JSON map
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      json['id'] as int,
      json['bio'] as String,
      json['username'] as String,
      json['emailId'] as String,
      json['phoneNumber'] as String,
      json['userId'] as int,
      json['status'] as String,
    );
  }

  // Method to convert Profile object to a JSON map
  Map<String, dynamic> toJson() => {
    'id': id,
    'bio': bio,
    'username': username,
    'emailId': emailId,
    'phoneNumber': phoneNumber,
    'userId': userId,
    'status': status,
  };
}
