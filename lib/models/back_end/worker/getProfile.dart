class ProfileInfo{

Provider? provider;
ProfileInfo.fromJson({required Map<String,dynamic>json}){
  provider= json['provider']!=null?Provider.fromJson(json: json['provider']):null;
}


}
class Provider{
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? address;
  String? job_title;
  String? job_description;
  String? gender;
  dynamic lat;
  dynamic lng;
  String? imageurl;
  String? category;
  Provider.fromJson({required Map<String,dynamic>json}){
    this.id=json['id'];
    this.first_name=json['first_name'];
    this.last_name=json['last_name'];
    this.email=json['email'];
    this.address=json['address'];
    this.job_title=json['job_title'];
    this.job_description=json['job_description'];
    this.lat=json['lat'];
    this.lng=json['lng'];
    this.imageurl=json['imageurl'];
    this.category=json['category'];

  }
}

