part of 'user_bloc_bloc.dart';

@freezed
class UserBlocEvent with _$UserBlocEvent {
  const factory UserBlocEvent.started() = _Started;
  const factory UserBlocEvent.userdetails(
     Usermodel user,
     String mode
  ) = _Userdetails;
  const factory UserBlocEvent.updateuserdetails(
     Usermodel user,
     String mode
  ) = _Updateuserdetails;
  const factory UserBlocEvent.getuserdetails() = _Getuserdetails;
}