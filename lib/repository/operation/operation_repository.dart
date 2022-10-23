import 'package:eran_by_saving/model/operation_model.dart';

abstract class OperationRepository {
  Future<List<Operation>> getAllOperation();
  Future<String> register();
  Future<String> update();
  Future<String> delete(Operation operation);
  Future<void> upload();
}
