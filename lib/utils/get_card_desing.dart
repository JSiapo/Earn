import 'package:eran_by_saving/constants/card_constant.dart';
import 'package:eran_by_saving/model/card_model.dart';
import 'package:eran_by_saving/widgets/cardBank/card_agora_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bbva_debit_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bcp_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_cmr_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_interbank_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_scotiabank_widget.dart';
import 'package:flutter/material.dart';

Widget getCardDesign(CardModel? card) {
  if (card == null) return const CardCurvoBCPCredimas();
  if (card.card == CARD.BCP) {
    return const CardCurvoBCPCredimas();
  }
  if (card.card == CARD.BBVA) {
    return const CardCurvoBBVADebit();
  }
  if (card.card == CARD.INTERBANK) {
    return const CardCurvoInterBank();
  }
  if (card.card == CARD.SCOTIABANK) {
    return const CardCurvoScotiaBank();
  }
  if (card.card == CARD.CMR) {
    return const CardCurvoCMRDebito();
  }
  if (card.card == CARD.AGORA) {
    return const CardAgora();
  }
  return const CardCurvoInterBank();
}
