import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bbva_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bcp_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_interbank_widget.dart';
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

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, _) {
      return PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: const [
          CardCurvoInterBank(),
          CardCurvoBCPCredimas(),
          CardCurvoBBVACompras(),
        ],
        // itemBuilder: (context, index) {
        //   if (data.indexCard == 0) return const CardCurvoInterBank();
        //   return const CardCurvoBCPCredimas();
        // },
        onPageChanged: (page) {
          data.cardChanged(page, pageController.page);
        },
      );
    });
  }
}
