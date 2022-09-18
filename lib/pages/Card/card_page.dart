import 'package:barcode_widget/barcode_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
// import 'package:eran_by_saving/utils/to_chart_data.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bank.dart';
// import 'package:eran_by_saving/widgets/chart/pie_chart.dart';
// import 'package:eran_by_saving/widgets/history/list_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class CardPage extends StatelessWidget with BasePage {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<CardProvider>(builder: (context, data, _) {
      return Consumer<HomeProvider>(builder: (context, dataHome, _) {
        return Consumer<OperationProvider>(
            builder: (context, dataOperation, _) {
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
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                  label: 'Invitar',
                  onPressed: () async {},
                ),
              ],
              child: const Icon(Icons.account_balance_wallet_sharp),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight: responsive.isLandscape ? 250 : 190),
                        height: responsive.hp(27),
                        width: responsive.wp(80),
                        child: CardBankWithData(card: data.card!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Gastos',
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data.card!.currency} ${dataOperation.operationsExpenses.isNotEmpty ? dataOperation.operationsExpenses.map((e) => e.mount).reduce((value, element) => value + element).toStringAsFixed(2) : "0.00"}',
                              textScaleFactor: 1.5,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Ingresos',
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${data.card!.currency} ${dataOperation.operationsEarning.isNotEmpty ? dataOperation.operationsEarning.map((e) => e.mount).reduce((value, element) => value + element).toStringAsFixed(2) : "0.00"}',
                              textScaleFactor: 1.5,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 18),
                        child: Text(
                          'PROPIETARIO',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        data.card!.owner.name,
                        style: GoogleFonts.roboto(),
                      ),
                      leading: CachedNetworkImage(
                        imageUrl: data.card!.owner.image,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          // radius: responsive.wp(7),
                          maxRadius: responsive.isLandscape
                              ? responsive.wp(4)
                              : responsive.wp(5),
                          minRadius: responsive.wp(3),
                          backgroundColor: Theme.of(context).cardColor,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) => CircleAvatar(
                          radius: responsive.wp(5),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: IconButton(
                            // color: Colors.white,
                            visualDensity: VisualDensity.comfortable,
                            iconSize: responsive.wp(6),
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.user),
                          ),
                        ),
                        errorWidget: (context, url, error) => CircleAvatar(
                          radius: responsive.wp(5),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: IconButton(
                            // color: Colors.white,
                            visualDensity: VisualDensity.comfortable,
                            iconSize: responsive.wp(6),
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.user),
                          ),
                        ),
                      ),
                      trailing: data.card!.owner.mount > 0
                          ? Text(
                              '${data.card!.currency} ${data.card!.owner.mount.toStringAsFixed(2)}',
                              style: GoogleFonts.lato(),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (data.card!.guests.isNotEmpty)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 18),
                          child: Text(
                            'INVITADOS',
                            style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  if (data.card!.guests.isNotEmpty)
                    SizedBox(
                      height: responsive.hp(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: data.card!.guests
                              .map((e) => ListTile(
                                    isThreeLine: true,
                                    title: Text(
                                      e.name,
                                      style: GoogleFonts.roboto(),
                                    ),
                                    subtitle: Text('Fecha: ${e.fecha}'),
                                    leading: CachedNetworkImage(
                                      imageUrl: e.image,
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        // radius: responsive.wp(5),
                                        maxRadius: responsive.isLandscape
                                            ? responsive.wp(4)
                                            : responsive.wp(5),
                                        minRadius: responsive.wp(3),
                                        backgroundColor:
                                            Theme.of(context).cardColor,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: responsive.wp(5),
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        child: IconButton(
                                          // color: Colors.white,
                                          visualDensity:
                                              VisualDensity.comfortable,
                                          iconSize: responsive.wp(6),
                                          onPressed: () {},
                                          icon: const FaIcon(
                                              FontAwesomeIcons.user),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: responsive.wp(5),
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        child: IconButton(
                                          // color: Colors.white,
                                          visualDensity:
                                              VisualDensity.comfortable,
                                          iconSize: responsive.wp(6),
                                          onPressed: () {},
                                          icon: const FaIcon(
                                              FontAwesomeIcons.user),
                                        ),
                                      ),
                                    ),
                                    trailing: Text(
                                      '${data.card!.currency} ${e.mount.toStringAsFixed(2)}',
                                      style: GoogleFonts.lato(),
                                    ),
                                  ))
                              .toList(),
                          // [

                          //   ListTile(
                          //     isThreeLine: true,
                          //     title: Text(
                          //       'José Luis Octavio Siapo Rodríguez',
                          //       style: GoogleFonts.roboto(),
                          //     ),
                          //     subtitle: const Text('Fecha: 28/07/2022'),
                          //     leading: CachedNetworkImage(
                          //       imageUrl:
                          //           "https://images.pexels.com/photos/2076494/pexels-photo-2076494.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          //       imageBuilder: (context, imageProvider) =>
                          //           CircleAvatar(
                          //         // radius: responsive.wp(7),
                          //         maxRadius: responsive.isLandscape
                          //             ? responsive.wp(4)
                          //             : responsive.wp(5),
                          //         minRadius: responsive.wp(3),
                          //         backgroundColor: Theme.of(context).cardColor,
                          //         backgroundImage: imageProvider,
                          //       ),
                          //     ),
                          //     trailing: Text(
                          //       'S./ 3500.00',
                          //       style: GoogleFonts.lato(),
                          //     ),
                          //   ),
                          //   ListTile(
                          //     isThreeLine: true,
                          //     title: Text(
                          //       'José Luis Octavio Siapo Rodríguez',
                          //       style: GoogleFonts.roboto(),
                          //     ),
                          //     subtitle: const Text('Fecha: 28/07/2022'),
                          //     leading: CachedNetworkImage(
                          //       imageUrl:
                          //           "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          //       imageBuilder: (context, imageProvider) =>
                          //           CircleAvatar(
                          //         // radius: responsive.wp(7),
                          //         maxRadius: responsive.isLandscape
                          //             ? responsive.wp(4)
                          //             : responsive.wp(5),
                          //         minRadius: responsive.wp(3),
                          //         backgroundColor: Theme.of(context).cardColor,
                          //         backgroundImage: imageProvider,
                          //       ),
                          //     ),
                          //     trailing: Text(
                          //       'S./ 3500.00',
                          //       style: GoogleFonts.lato(),
                          //     ),
                          //   ),
                          // ],
                        ),
                      ),
                    )
                  // TODO pie chart
                  // dataOperation.operationsFiltered.isNotEmpty
                  //     ? SizedBox(
                  //         height: responsive.hp(35),
                  //         child: PieChartWidget(
                  //           operations: dataOperation.operationsFiltered,
                  //           dataChart: dataOperation.dataWithLabels,
                  //         ))
                  //     : Container(),
                ],
              ),
            ),
          );
        });
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
