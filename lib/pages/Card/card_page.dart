import 'package:barcode_widget/barcode_widget.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
import 'package:eran_by_saving/widgets/history/list_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class CardPage extends StatelessWidget with BasePage {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<CardProvider>(builder: (context, data, _) {
      return Consumer<HomeProvider>(builder: (context, dataHome, _) {
        return Scaffold(
          appBar: getclearAppBar(context, actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enableDrag: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: responsive.hp(30),
                          child: dialogChild(context, dataHome, data),
                        );
                      });
                },
                icon: const FaIcon(FontAwesomeIcons.paperPlane),
                tooltip: "COMPARTIR")
          ]),
          floatingActionButton: SpeedDial(
            labelsBackgroundColor:
                dataHome.settings.isDark ? Colors.black : Colors.white,
            speedDialChildren: <SpeedDialChild>[
              SpeedDialChild(
                child: const Icon(Icons.delete),
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                label: 'Eliminar',
                onPressed: () async {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.edit),
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow,
                label: 'Editar',
                onPressed: () async {},
              ),
            ],
            child: const Icon(Icons.account_balance_wallet_sharp),
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
                    height: responsive.hp(25),
                    width: responsive.wp(80),
                    child: CardBankWithData(card: data.card!),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'S./2750.0',
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
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
              SizedBox(
                height: responsive.hp(10),
              )
            ],
          ),
        );
      });
    });
  }
}

Widget dialogChild(
    BuildContext context, HomeProvider dataHome, CardProvider data) {
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
      ));
}
