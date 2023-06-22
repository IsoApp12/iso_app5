class CustomerView{
  data? customer;
  CustomerView.fromJson({required Map<String,dynamic>json}){
    customer=json['customer']!=null?data.fromJson(json['customer']):null;
}
}

class data {
  dynamic id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  String? gender;
  String? lat;
  String? lng;
  String? address;
  dynamic active;
  String? apiToken;




  data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];

    gender = json['gender'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    active = json['active'];
    apiToken = json['api_token'];

  }


}
