class WorkerLogin {
  Provider? provider;
  WorkerLogin.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] ;
  }
   }
class Provider{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  Null cityId;
  Null regionId;
  Null categoryId;
  Null subCategoryId;
  Null lat;
  Null lng;
  Null address;
  Null image;
  Null jobTitle;
  Null jobDescription;
  Null gender;
  String? active;
  String? token;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Null imageurl;
  Null region;
  Null city;
  Null category;
  Null subCategory;
  Provider.fromJson(Map<String, dynamic> json) {
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
    token = json['token'];
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