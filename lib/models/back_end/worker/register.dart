class Register{
  String? message;
  int? type;
  Register.fromJson({required Map<String,dynamic>Json}){
    this.message=Json['message'];
    this.type=Json['type'];
  }
}