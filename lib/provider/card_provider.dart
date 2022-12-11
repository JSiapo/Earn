import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/repository/card/cards_repository.dart';
import 'package:eran_by_saving/repository/card/card_repository_imp.dart';
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

  Future<void> refresh(BuildContext ctx) async {
    _cards = await repository.getAllCards();
    cards = _cards;
    if (_cards.isEmpty) {
      card = null;
    } else {
      updateCurrentCard(ctx);
    }
  }

  setFirstCard() {
    if (card == null && _cards.isNotEmpty) {
      card = _cards[0];
    }
  }

  updateCurrentCard(BuildContext ctx) {
    if (card != null && _cards.isNotEmpty) {
      // _cards.firstWhere((element) => false)
      card = _cards.firstWhere(
        (element) => element.id == card!.id,
        orElse: () => _cards[0],
      );
    }
    if (card == null && _cards.isNotEmpty) {
      setFirstCard();
      ctx.read<OperationProvider>().findOperationsFiltered(card?.id);
      // card = _cards.firstWhere((element) => element.id == card!.id);
    }
    if (_cards.isEmpty) {
      ctx.read<OperationProvider>().clearAll();
    }
    notifyListeners();
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
