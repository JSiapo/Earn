import 'package:barcode_widget/barcode_widget.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/show_dialog.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
import 'package:eran_by_saving/widgets/history/list_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget with BasePage {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<CardProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: getclearAppBar(context, title: "DETALLE DE CUENTA", actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.lock_open),
              tooltip: "MOSTRAR SALDO")
        ]),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Gastos',
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'S./350.0',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'Ingresos',
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'S./2750.0',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(responsive.hp(2)),
                child: const HistoryList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(alignment: Alignment.center, children: [
                Consumer<HomeProvider>(builder: (context, dataHome, _) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.hp(2),
                      horizontal: responsive.wp(10),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          showCustomDialog(
                            context,
                            dialogChild(dataHome, data),
                          );
                        },
                        child: Row(children: [
                          const Expanded(child: SizedBox()),
                          const FaIcon(FontAwesomeIcons.paperPlane),
                          SizedBox(width: responsive.wp(5)),
                          const Text('Compartir mi cuenta'),
                          const Expanded(child: SizedBox()),
                        ])),
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

Widget dialogChild(HomeProvider dataHome, CardProvider data) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: BarcodeWidget(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromARGB(255, 255, 255, 255),
          color: dataHome.settings.isDark ? Colors.white : Colors.grey[200]!),
      barcode: Barcode.qrCode(),
      data: data.card!.id,
      color: dataHome.settings.isDark ? Colors.black : Colors.black,
      padding: const EdgeInsets.all(15.0),
    ),
  );
}
