// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';

class EditAudioTagUseCase {
  final PlatformRepository repository;
  EditAudioTagUseCase({
    required this.repository,
  });
  Future<Either<Failures,bool>>call(Map<String,dynamic> audiotags){
    return repository.updateaudiotag(audiotags);
  }
}
