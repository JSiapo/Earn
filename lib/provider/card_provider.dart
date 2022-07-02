import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/repository/card_repository_imp.dart';
import 'package:eran_by_saving/repository/cards_repository.dart';
import 'package:eran_by_saving/utils/debouncer.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  CardRepository repository = CardRepositoryImp();
  List<CardModel> cards = [];
  CardModel? card;
  final _debouncer = Debouncer(milliseconds: 1100);

  Future<bool> getAll() async {
    cards = await repository.getAllCards();
    setFirstCard();
    return true;
  }

  setFirstCard() {
    if (card == null && cards.isNotEmpty) {
      card = cards[0];
    }
  }

  Future<void> setCardByPosition(int position, {bool isAsync = false}) async {
    if (isAsync) {
      _debouncer.run(() {
        card = cards[position];
        notifyListeners();
      });
    } else {
      card = cards[position];
      notifyListeners();
    }
  }
}
