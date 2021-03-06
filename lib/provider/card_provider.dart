import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/repository/card_repository_imp.dart';
import 'package:eran_by_saving/repository/cards_repository.dart';
import 'package:eran_by_saving/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProvider extends ChangeNotifier {
  CardRepository repository = CardRepositoryImp();
  List<CardModel> _cards = [];
  CardModel? card;
  final _debouncer = Debouncer(milliseconds: 500);
  List<CardModel> get cards => _cards;
  set cards(List<CardModel> newCards) {
    _cards = newCards;
    setFirstCard();
  }

  Future<bool> getAll() async {
    cards = await repository.getAllCards();
    return true;
  }

  setFirstCard() {
    if (card == null && _cards.isNotEmpty) {
      card = _cards[0];
    }
  }

  Future<void> setCardByPosition(BuildContext ctx, int position,
      {bool isAsync = false}) async {
    if (isAsync) {
      _debouncer.run(() {
        card = _cards[position];
        notifyListeners();
        ctx.read<OperationProvider>().findOperationsFiltered(card?.id);
      });
    } else {
      card = _cards[position];
      notifyListeners();
    }
  }
}
