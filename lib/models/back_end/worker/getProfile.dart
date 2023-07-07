

import 'package:geocoder2/geocoder2.dart';

class ProfileInfo{

Provider? provider;
ProfileInfo.fromJson({required Map<String,dynamic>json}){
  provider= json['provider']!=null?Provider.fromJson(json: json['provider']):null;
}


}


class Provider{
  dynamic? id;
  dynamic? first_name;
  dynamic? last_name;
  dynamic? email;
  dynamic? phone;
  dynamic? job_title;
  dynamic? job_description;
  dynamic? gender;
  dynamic? api_token;
  dynamic lat;
  dynamic lng;
  dynamic? imageurl;
  dynamic? category;
  List <Order> orders=[];
  List <Rate>rates=[];
  double rateSum=0;
  dynamic address;
  Provider.fromJson({required Map<String,dynamic>json}){
    this.id=json['id'];
    this.first_name=json['first_name'];
    this.last_name=json['last_name'];
    this.email=json['email'];
    this.address=json['address'];
    this.job_title=json['job_title'];
    this.job_description=json['job_description'];
    this.api_token=json['api_token'];
    this.lat=json['lat'];
    this.lng=json['lng'];
    this.address=json['address'];
    this.phone=json['phone'];
    this.imageurl=json['imageurl'];
    this.category=json['category'];
    json['orders'].forEach((e){
      orders.add( Order.fromJson(json:e));
    });
    json['rates'].forEach((e){
  rates.add( Rate.fromJson(json:e));
  });

  rates.forEach((element) {
    rateSum += double.parse(element.rate);
  });

}



}

class Order{
  dynamic? id ;
  dynamic? customer_id ;
  dynamic? provider_id ;
  String? date ;
  dynamic? status ;
  String? created_at ;
  Customer ? customer;
  Order.fromJson({required Map <String,dynamic>json}){
    this.id=json['id'];
    this.customer_id=json['customer_id'];
    this.provider_id=json['provider_id'];
    this.date=json['date'];
    this.status=json['status'];
    this.created_at=json['created_at'];
    this.customer=json['customer']!=null?Customer.fromJson(json: json['customer']):null;
  }

}


class Customer{
  dynamic? id ;
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
class Rate {
  dynamic id ;
  dynamic customer_id ;
  dynamic provider_id ;
  dynamic rate ;
  dynamic created_at ;
  Rate.fromJson({required Map <String,dynamic>json}){
    this.id=json['id'];
    this.customer_id=json['customer_id'];
    this.provider_id=json['provider_id'];
    this.rate=json['rate'];
    this.created_at=json['created_at'];
  }

}
