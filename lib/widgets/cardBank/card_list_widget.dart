import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (context.read<CardProvider>().card != null) {
      final page = context
          .read<CardProvider>()
          .cards
          .indexOf(context.read<CardProvider>().card!);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.jumpToPage(page);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, data, _) {
      return PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: data.cards
            .map(
              (e) => GestureDetector(
                onTap: () {
                  goTo(context, PAGES.cardPage.route);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CardBankWithData(card: e),
                ),
              ),
            )
            .toList(),
        onPageChanged: (page) {
          data.setCardByPosition(
            context,
            page,
            isAsync: true,
          );
        },
      );
    });
  }
}
