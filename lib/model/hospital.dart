class Hospitaldetail {
  late int hospital_id;
  late String hospital_name;
  late int hospital_number;

  Hospitaldetail(
      {required this.hospital_id,
      required this.hospital_name,
      required this.hospital_number});

  factory Hospitaldetail.fromJson(Map<String, dynamic> json) {
    return Hospitaldetail(
        hospital_id: json['hospitaldetailsid'],
        hospital_name: json['name'],
        hospital_number: json['number']);
  }

  Map<String, dynamic> toJson() {
    return {
      'hospital_id': hospital_id,
      'hospital_name': hospital_name,
      'hospital_number': hospital_number
    };
  }
}
