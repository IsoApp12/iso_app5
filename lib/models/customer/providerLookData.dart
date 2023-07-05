import 'dart:core';
import 'dart:core';

class ProviderData{
  Providers? providers;
  ProviderData.fromJson({required Map <String,dynamic> json}){}

}
class Providers {
  int ? current_page;
  List <Data> ?data;
  String ? first_page_url;
  int ? from;
  int ? last_page_url;
}
class Data {
 int? id;
 String? first_name;
 String? last_name;
 String? email;
 String? phone;
 String? imageurl;

}