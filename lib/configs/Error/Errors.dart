import 'package:freezed_annotation/freezed_annotation.dart';
part 'Errors.freezed.dart';

@freezed
class Failures with _$Failures{
  const factory Failures.clientfailure() = _clientfail;
  const factory Failures.serverfailure() = _serverfail;
}