class UserLogin{
  int? type;
  String? api_token;
  UserLogin.fromJson({required Map<String,dynamic>json}){
    this.type=json['type'];
    this.api_token=json['user']['api_token'];
  }
}