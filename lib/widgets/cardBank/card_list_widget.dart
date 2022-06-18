import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/responsive.dart';
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
  void initState() {
    super.initState();
    final page = context.read<HomeProvider>().indexCard;
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

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, _) {
      return PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  const CardCurvoInterBank(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text('text'),
                              ),
                              Expanded(
                                child: Text('text'),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            child: const Text('text'),
                            alignment: Alignment.centerLeft,
                          ),
                          flex: 4,
                        ),
                        const Expanded(
                          child: Text('text'),
                          flex: 1,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const CardCurvoBCPCredimas()),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const CardCurvoBBVACompras()),
        ],
        onPageChanged: (page) {
          data.cardChanged(page, pageController.page);
        },
      );
    });
  }
}
