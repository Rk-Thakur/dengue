class Post {
  late int postId;
  late String description;
  late String postImage;

  Post(
      {required this.postId,
      required this.description,
      required this.postImage});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        postId: json['postId'],
        description: json['description'],
        postImage: json['postImage']);
  }
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'description': description,
      'postImage': postImage
    };
  }
}
