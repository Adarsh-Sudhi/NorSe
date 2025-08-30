part of 'user_bloc_bloc.dart';

@freezed
class UserBlocState with _$UserBlocState {
  const factory UserBlocState.initial() = _Initial;
  const factory UserBlocState.userdetails(
     Usermodel user,
  ) = _Userdetailstate;
}
