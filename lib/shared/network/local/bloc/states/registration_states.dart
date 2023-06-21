import 'package:iso_app_5/models/usrLogin.dart';
import 'package:iso_app_5/models/usrLogin.dart';

abstract class RegistrationStates{}
class InitRegistration extends RegistrationStates{}
class WorkerRegisterLoading extends RegistrationStates{}
class WorkerRegisterSuccess extends RegistrationStates{}
class WorkerRegisterError extends RegistrationStates{}
class UserLoginLoading extends RegistrationStates{}
class UserLoginSuccess extends RegistrationStates{
  UserLogin userLogin;
  UserLoginSuccess({required this.userLogin});
}
class UserLoginError extends RegistrationStates{}
class UserLoginAssigning extends RegistrationStates{}
class UserLoginAssigningWorker extends RegistrationStates{}
class UserLoginAssigningCustomer extends RegistrationStates{}

class CustomerRegisterError extends RegistrationStates{}
class CustomerRegisterLoading extends RegistrationStates{}
class CustomerRegisterSuccess extends RegistrationStates{}
class WorkerSetUpLoading extends RegistrationStates{}
class WorkerSetUpSuccess extends RegistrationStates{}
class WorkerSetUpError extends RegistrationStates{}
class VerificationLoading extends RegistrationStates{}
class VerificationSuccess extends RegistrationStates{}
class VerificationError extends RegistrationStates{}
class CameImageLoading extends RegistrationStates{}
class CameImagSuccess extends RegistrationStates{}
class CameImageError extends RegistrationStates{}
class ChangeControllerText extends RegistrationStates{}
class ChangeIsLast extends RegistrationStates{}
class pickProfileLoading extends RegistrationStates{}
class pickProfileSuccess extends RegistrationStates{}
class pickProfileeError extends RegistrationStates{}


class GetProfileCustomerLoading extends RegistrationStates{}
class GetProfileCustomerSuccess extends RegistrationStates{}
class GetProfileCustomerError extends RegistrationStates{}
class UpdateProfileCustomerLoading extends RegistrationStates{}
class UpdateProfileCustomerSuccess extends RegistrationStates{}
class UpdateProfileCustomerError extends RegistrationStates{}
class SetUpenabledPermissionSuccess extends RegistrationStates{}
class GetsetupLocationSuccess extends RegistrationStates{}
class SetUpenabledPermissionError extends RegistrationStates{}
class getAdressSuccess extends RegistrationStates{}
class getAdressError extends RegistrationStates{}
class WorkerGetProfileInfoLoadingReg extends RegistrationStates{}
class WorkerGetProfileInfoSuccessReg extends RegistrationStates{}
class WorkerGetProfileInfoErrorReg extends RegistrationStates{}


