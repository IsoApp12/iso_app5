class UserLoginModelWorker {
  User? user;
  int? type;

  UserLoginModelWorker({this.user, this.type});

  UserLoginModelWorker.fromJson(Map<String, dynamic> json) {
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
  dynamic categoryId;
  dynamic subCategoryId;
  dynamic lat;
  dynamic lng;
  dynamic address;
  dynamic image;
  dynamic jobTitle;
  dynamic jobDescription;
  dynamic gender;
  String? active;
  String? apiToken;
  String? code;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic imageurl;
  dynamic region;
  dynamic city;
  dynamic category;
  dynamic subCategory;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    image = json['image'];
    jobTitle = json['job_title'];
    jobDescription = json['job_description'];
    gender = json['gender'];
    active = json['active'];
    apiToken = json['api_token'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imageurl = json['imageurl'];
    region = json['region'];
    city = json['city'];
    category = json['category'];
    subCategory = json['sub_category'];
  }


}
