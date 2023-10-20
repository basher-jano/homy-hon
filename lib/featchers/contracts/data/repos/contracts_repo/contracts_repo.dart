import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/contracts/data/models/contracts_mode.dart';

abstract class ContractsRepo {
  Future<Either<String, Contracts>> getAllContracts();
  Future<Either<String, String>> addContract({
    required int id,
    required String name,
    required String phone,
    required String ratio,
  });
}
