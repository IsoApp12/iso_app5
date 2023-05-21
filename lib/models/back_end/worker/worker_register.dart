class WorkerRegister
{
  String? message;
  int? type;
  WorkerRegister.fromJson({required Map<String,dynamic>json}){
    this.message=json['message'];
    this.type=json['type'];
  }
}