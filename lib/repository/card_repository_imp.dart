import 'package:eran_by_saving/constants/card_constant.dart';
import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/repository/cards_repository.dart';

class CardRepositoryImp extends CardRepository {
  @override
  Future<List<CardModel>> getAllCards() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return [
      CardModel(
        amount: 0.0,
        card: CARD.BCP,
        name: "BCP - Cuenta de ahorro en dólares",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.BCP,
        name: "BCP - Cuenta de ahorro en soles",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "34d1b99a-fb8b-46f5-a536-fc5d58965e10",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.INTERBANK,
        name: "INTERBANK - Cuenta de ahorro en soles",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "3a9bb15e-57a0-4df4-985e-63902c5eecf1",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.BBVA,
        name: "BBVA - Cuenta de ahorro en soles",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "4859b7f2-3c67-4dd3-b477-3f760c7972a9",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.BBVA,
        name: "BBVA - Cuenta de ahorro en dólares",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "4859b7f2-3c67-4dd3-b477-3f760c7972a0",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.SCOTIABANK,
        name: "SCOTIABANK - Cuenta de ahorro en soles",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "41db3056-078e-4352-9484-a285f4a1ed6e",
      ),
      CardModel(
        amount: 0.0,
        card: CARD.SCOTIABANK,
        name: "SCOTIABANK - Cuenta de ahorro en dólares",
        nro: "123-xxx-123",
        nroCCI: "123-xxx-123",
        id: "e1077d05-940d-40e2-8c6f-eba6a33995d2",
      ),
    ];
  }
}
