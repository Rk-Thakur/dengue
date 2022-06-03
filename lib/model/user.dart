class Customer {
  final String userImage;
  final String userId;
  final String userName;
  final String email;

  Customer({
    required this.userImage,
    required this.userId,
    required this.userName,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        userImage: json['image'],
        userId: json['userId'],
        userName: json['username'],
        email: json['email']);
  }
}
