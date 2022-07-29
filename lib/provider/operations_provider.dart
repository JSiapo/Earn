import 'package:eran_by_saving/model/operation_model.dart';
import 'package:eran_by_saving/repository/operation/operation_repository.dart';
import 'package:eran_by_saving/repository/operation/operation_repository_imp.dart';
import 'package:flutter/material.dart';

class OperationProvider extends ChangeNotifier {
  OperationRepository repository = OperationRepositoryImp();
  List<Operation> operations = [];
  List<Operation> operationsFiltered = [];
  Operation? currentOperation;

  setOperation(Operation operation) {
    currentOperation = operation;
    notifyListeners();
  }

  Future<void> getAll() async {
    operations = await repository.getAllOperation();
  }

  findOperationsFiltered(String? id) {
    operationsFiltered =
        operations.where((operation) => operation.cardId == id).toList();
    notifyListeners();
  }
}
