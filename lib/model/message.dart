class message {
  late final String text;
  late final String profilepicture;
  late final String postimage;
  late final String username;
  late final String userId;
  // message(
  //     {required this.text,
  //     required this.userImage,
  //     required this.userId,
  //     required this.username});
  message(
      [this.text = '',
      this.postimage = '',
      this.profilepicture = '',
      this.userId = '',
      this.username = '']);

  factory message.fromJson(Map<String, dynamic> json) {
    return message(json['text'], json['profilepicture'], json['postimage'],
        json['userId'], json['username']);
  }
  Map<String, dynamic> toJson() {
    return {
      'profilepicture': this.profilepicture,
      'username': this.username,
      'message': this.text,
      'userId': this.userId,
      'postimage': this.postimage
    };
  }
}
