import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states_services.dart';

class ServicesBloc extends Cubit<ServicesStates>{
  ServicesBloc():super(InitialState());
static ServicesBloc get(context)=>BlocProvider.of(context);

void workerRegister({required String first_name,required String last_name,required String email,required String password,
required int phone,required int city_id,required int region_id,required int category_id
})async{
  emit(WorkerRegisterLoading());
  DioClient.post(
      path: 'provider/register',
      data: {
        'first_name':first_name,
        'last_name':last_name,
        'email':email,
        'password':password,
        'phone':phone,
        'city_id':city_id,
        'region_id':region_id,
        'category_id':category_id}
  ).then((value) {
    emit(WorkerRegisterSuccess());


  }).catchError((onError){
    emit(WorkerRegisterError());
    print('!!!!!!!!!!!!1${onError}');
  });

}

}