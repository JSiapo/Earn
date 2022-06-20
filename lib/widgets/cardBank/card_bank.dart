import 'package:eran_by_saving/constants/card_constant.dart';
import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bbva_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bcp_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_interbank_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardBankWithData extends StatelessWidget {
  final CardModel card;
  const CardBankWithData({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card.card == CARD.BCP) {
      return CardBank(card: const CardCurvoBCPCredimas(), data: card);
    }
    if (card.card == CARD.BBVA) {
      return CardBank(card: const CardCurvoBBVACompras(), data: card);
    }

    if (card.card == CARD.INTERBANK) {
      return CardBank(card: const CardCurvoInterBank(), data: card);
    }
    return CardBank(card: const CardCurvoInterBank(), data: card);
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
                        style: const TextStyle(color: Colors.white),
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
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "CCI: ${data.nroCCI}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                ),
                flex: 4,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${data.amount}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const FaIcon(FontAwesomeIcons.ccVisa, color: Colors.white),
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
