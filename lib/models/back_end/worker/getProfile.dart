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
  List <Order> orders=[];
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
    this.phone=json['lng'];
    this.imageurl=json['imageurl'];
    this.category=json['category'];
    json['orders'].forEach((e){
      orders.add( Order.fromJson(json:e));
    });
  }
}

class Order{
  int? id ;
  int? customer_id ;
  int? provider_id ;
  String? date ;
  int? status ;
  String? created_at ;
  Customer ? customer;
  Order.fromJson({required Map <String,dynamic>json}){
    this.id=json['id'];
    this.customer_id=json['customer_id'];
    this.provider_id=json['provider_id'];
    this.date=json['date'];
    this.status=json['status'];
    this.created_at=json['created_at'];
    this.customer=json['customer'];
  }

}


class Customer{
  int? id ;
  String? first_name ;
  String? last_name ;
  String? email ;
  String? phone ;
  String? gender ;
  String? imageurl ;
  String? address ;
  Customer.fromJson({required Map <String,dynamic>json}){
    this.id=json['id'];
    this.first_name=json['first_name'];
    this.last_name=json['last_name'];
    this.email=json['email'];
    this.phone=json['phone'];
    this.gender=json['gender'];
    this.imageurl=json['imageurl'];
    this.address=json['address'];
  }


}
