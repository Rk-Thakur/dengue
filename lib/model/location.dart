class location {
  late String detection_id;
  late String description;
  late String image;
  late double lat;
  late double long;
  location(
      {required this.detection_id,
      required this.description,
      required this.image,
      required this.lat,
      required this.long});

  factory location.fromJson(Map<String, dynamic> json) {
    return location(
        detection_id: json['detection_id'],
        description: json['description'],
        image: json['image'],
        lat: json['lat'],
        long: json['long']);
  }

  Map<String, dynamic> toJson() {
    return {
      'detection_id': detection_id,
      'description': description,
      'image': image,
      'lat': lat,
      'long': long
    };
  }
}
