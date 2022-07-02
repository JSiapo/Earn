import 'package:eran_by_saving/model/card_model.dart';

abstract class CardRepository {
  Future<List<CardModel>> getAllCards();
}
