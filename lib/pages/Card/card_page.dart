import 'package:barcode_widget/barcode_widget.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget with BasePage {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<CardProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 350, maxWidth: 400),
                  height: responsive.hp(30),
                  width: responsive.wp(90),
                  child: CardBankWithData(card: data.card!),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(alignment: Alignment.center, children: [
                Consumer<HomeProvider>(builder: (context, dataHome, _) {
                  return BarcodeWidget(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: const Color.fromARGB(255, 255, 255, 255),
                        color: dataHome.settings.isDark
                            ? Colors.white
                            : Colors.grey[200]!),
                    barcode: Barcode.qrCode(),
                    data: data.card!.id,
                    color:
                        dataHome.settings.isDark ? Colors.black : Colors.black,
                    width: responsive.wp(50),
                    height: responsive.wp(50),
                    padding: const EdgeInsets.all(15.0),
                  );
                })
              ]),
            )
          ],
        ),
      );
    });
  }
}
