import 'package:eran_by_saving/constants/card_constant.dart';
import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  final int index;

  const CardList(this.index, {Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final PageController pageController = PageController();
  List<CardModel> cardListData = [];

  @override
  void initState() {
    super.initState();
    final page = context.read<HomeProvider>().indexCard;
    readModels();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.jumpToPage(page);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void readModels() {
    cardListData.addAll([
      CardModel(
          amount: 0.0,
          card: CARD.BCP,
          name: "BCP - Cuenta de ahorro en dólares",
          nro: "123-xxx-123",
          nroCCI: "123-xxx-123"),
      CardModel(
          amount: 0.0,
          card: CARD.BCP,
          name: "BCP - Cuenta de ahorro en soles",
          nro: "123-xxx-123",
          nroCCI: "123-xxx-123"),
      CardModel(
          amount: 0.0,
          card: CARD.INTERBANK,
          name: "INTERBANK - Cuenta de ahorro en soles",
          nro: "123-xxx-123",
          nroCCI: "123-xxx-123"),
      CardModel(
          amount: 0.0,
          card: CARD.BBVA,
          name: "BBVA - Cuenta de ahorro en soles",
          nro: "123-xxx-123",
          nroCCI: "123-xxx-123"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, _) {
      return PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: cardListData
            .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CardBankWithData(card: e)))
            .toList(),
        onPageChanged: (page) {
          data.cardChanged(page, pageController.page);
        },
      );
    });
  }
}
