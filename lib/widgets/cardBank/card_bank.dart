import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/utils/get_card_desing.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bcp_widget.dart';
import 'package:flutter/material.dart';

class CardBankWithData extends StatelessWidget {
  final CardModel? card;
  const CardBankWithData({Key? key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card == null) return const CardCurvoBCPCredimas();
    getCardDesign(card);
    return CardBank(card: getCardDesign(card), data: card!);
  }
}

class CardBank extends StatelessWidget {
  final Widget card;
  final CardModel data;
  const CardBank({Key? key, required this.card, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        card,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        softWrap: true,
                        textScaleFactor: 1.1,
                      ),
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.nro,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        textScaleFactor: 1,
                      ),
                      Text(
                        "CCI: ${data.nroCCI}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${data.currency} ${data.amount}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textScaleFactor: 1,
                    ),
                    getIconWidget(IconsAvailables.visa, color: Colors.white),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
