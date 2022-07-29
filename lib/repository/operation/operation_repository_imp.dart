import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/model/operation_model.dart';
import 'package:eran_by_saving/repository/operation/operation_repository.dart';

class OperationRepositoryImp extends OperationRepository {
  @override
  Future<String> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Operation>> getAllOperation() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return [
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        name: "Hidrandina",
        description: "Pago de servicio mensual de luz",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        accountNumber: "****4455",
        dateStr: "02/07/2022",
        mount: 79.80,
        icon: "boltLightning",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
        evidence: [
          "https://noticiasresponsables.com/wp-content/uploads/2019/07/Hidrandina.jpg",
          "https://noticiasresponsables.com/wp-content/uploads/2020/07/Hidrandina-1299x1536.jpg",
        ],
      ),
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf3b",
        name: "Sedalib",
        description: "Pago de servicio mensual de agua",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        accountNumber: "****4455",
        dateStr: "02/07/2022",
        mount: 42.20,
        icon: "droplet",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
        evidence: [],
      ),
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        name: "Claro",
        description: "Pago de servicio mensual de internet",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        accountNumber: "****4455",
        dateStr: "02/07/2022",
        mount: 131,
        icon: "wifi",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
        evidence: [],
      ),
      Operation(
          id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
          name: "Quavi",
          description: "Pago de servicio mensual de gas",
          cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
          accountNumber: "****4455",
          dateStr: "02/07/2022",
          mount: 42,
          icon: "fireFlameCurved",
          operation: OPERATION.pay,
          currency: CURRENCY.PEN,
          evidence: [
            "https://noticiasresponsables.com/wp-content/uploads/2019/07/Hidrandina.jpg",
          ]),
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        name: "Quavi",
        description: "Pago de servicio mensual de gas",
        cardId: "3a9bb15e-57a0-4df4-985e-63902c5eecf1",
        accountNumber: "****4455",
        dateStr: "02/07/2022",
        mount: 32,
        icon: "fireFlameCurved",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
        evidence: [],
      )..isOffline = false,
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        name: "YAWI",
        description: "Ingreso mensual",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        accountNumber: "****4455",
        dateStr: "01/07/2022",
        mount: 1765.00,
        icon: "building",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
        evidence: [],
      )..isExpense = false,
      Operation(
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        name: "FOCUS",
        description: "Ingreso mensual",
        cardId: "4859b7f2-3c67-4dd3-b477-3f760c7972a0",
        accountNumber: "****4455",
        dateStr: "02/07/2022",
        mount: 187.50,
        icon: "building",
        operation: OPERATION.pay,
        currency: CURRENCY.USD,
        evidence: [],
      )..isExpense = false
    ];
  }

  @override
  Future<String> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<String> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> upload() {
    // TODO: implement upload
    throw UnimplementedError();
  }
}
