// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';

class Getvideoinfousecase {
  final APIRepository repository;
  const Getvideoinfousecase({
    required this.repository,
  });
  Future<Map<String, dynamic>> call(String id) async {
    return repository.getvideoinfo(id);
  }
}
