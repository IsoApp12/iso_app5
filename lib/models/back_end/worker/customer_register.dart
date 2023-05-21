class CustomerRegister
{
  dynamic message;
  dynamic type;
  CustomerRegister.fromJson({required Map<String,dynamic>json}){
    this.message=json['message'];
    this.type=json['type'];
  }
}