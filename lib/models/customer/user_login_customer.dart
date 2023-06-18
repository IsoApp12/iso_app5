class UserLoginCustomer {
  User? user;
  int? type;


  UserLoginCustomer.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    type = json['type'];
  }

}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic cityId;
  dynamic regionId;
  dynamic gender;
  dynamic lat;
  dynamic lng;
  dynamic address;
  String? active;
  String? apiToken;
  dynamic image;
  String? code;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic imageurl;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    gender = json['gender'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    active = json['active'];
    apiToken = json['api_token'];
    image = json['image'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imageurl = json['imageurl'];
  }


}
