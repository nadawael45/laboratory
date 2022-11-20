class RegisterModel{
  String? phone;
  String? name;
  String? patientId;

  RegisterModel({this.phone, this.name, this.patientId});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    name = json['name'];
    phone = json['phone'];

  }

   toJson() {
    return {
      'phone': phone,
      'name': name,
      'patientId': patientId
    };
  }


}