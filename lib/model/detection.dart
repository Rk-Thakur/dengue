class Detection {
  late double lat;
  late double long;
  late String image1;
  late String image2;
  late String image3;
  late String description;
  late int detectionId;

  Detection(
      {required this.detectionId,
      required this.lat,
      required this.long,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.description});

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
        detectionId: json['detectionId'],
        lat: json['lat'],
        long: json['long'],
        image1: json['image1'],
        image2: json['image2'],
        image3: json['image3'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'detectionId': detectionId,
      'lat': lat,
      'long': long,
      'images1': image1,
      'images2': image2,
      'images3': image3,
      'description': description
    };
  }
}
