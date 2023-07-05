class ProvidersBelong{
  List<Data> data=[];
  ProvidersBelong.fromJson({required Map<String ,dynamic>json}){
    json['providers']['data'].forEach((e){
      data.add(Data.fromJson(json: e));
    });
  }
}
class Data {
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
  Data.fromJson({required Map<String,dynamic>json}){
    this.id=json['id'];
    this.first_name=json['first_name'];
    this.last_name=json['last_name'];
    this.email=json['email'];
    this.address=json['address'];
    this.job_title=json['job_title'];
    this.job_description=json['job_description'];
    this.lat=json['lat'];
    this.lng=json['lng'];
    this.phone=json['lng'];
    this.imageurl=json['imageurl'];
  }
}
