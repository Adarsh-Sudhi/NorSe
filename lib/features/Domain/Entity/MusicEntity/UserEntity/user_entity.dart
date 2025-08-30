import 'package:equatable/equatable.dart';

class Userentity extends Equatable{
   final String name;
   final String email;
   final String date;
   final String password;
  Userentity({
    required this.name,
    required this.email,
    required this.date,
    required this.password,
  });
  
  @override
  List<Object?> get props => [
    name,
    email,
    date,
    password
  ];

}
