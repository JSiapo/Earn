import 'dart:ui';

import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/getCardDesing.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/two_decimals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class TransferPage extends StatelessWidget with BasePage {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<HomeProvider>(builder: (context, dataHome, _) {
      return Consumer<CardProvider>(builder: (context, data, _) {
        return Scaffold(
          floatingActionButton: SpeedDial(
            labelsBackgroundColor:
                dataHome.settings.isDark ? Colors.black : Colors.white,
            speedDialChildren: <SpeedDialChild>[
              SpeedDialChild(
                child: getIconWidget(IconsAvailables.camera),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                label: 'Cámara',
                onPressed: () async {},
              ),
              SpeedDialChild(
                child: getIconWidget(IconsAvailables.gallery),
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow,
                label: 'Galería',
                onPressed: () async {},
              ),
            ],
            child: getIconWidget(IconsAvailables.gallery),
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    child: getIconWidget(IconsAvailables.arrowsLeft,
                        color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.grey[850],
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      color: Colors.black38,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      // height: 80,
                      width: responsive.wp(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'TRANSFERIR',
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data.card?.name}',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  titlePadding: const EdgeInsets.all(0),
                  centerTitle: true,
                  background: getCardDesign(data.card),
                  stretchModes: const [
                    StretchMode.blurBackground,
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Aqui se registran transeferencias a otras PERSONAS o uso de aplicaciones como YAPE, PLIN o similares, puede enviar imágenes o capturas de pantalla como evidencia de la operación. Como por ejemplo, transferir a encargado de compras para comprar pan en el supermercado',
                    style: GoogleFonts.lato(
                        fontSize: 13, fontStyle: FontStyle.italic),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    inputFormatters: [
                      DecimalTextInputFormatter(decimalRange: 2),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        prefix: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: getIconWidget(IconsAvailables.moneyBill)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Monto'),
                        hintText: '0.00'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese monto inicial de cuenta';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefix: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: getIconWidget(IconsAvailables.user),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Persona a transferir'),
                        hintText: 'Nombre de persona a transferir'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese nombre de la persona a transferir';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    maxLength: 100,
                    decoration: InputDecoration(
                        prefix: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: getIconWidget(IconsAvailables.pen),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Motivo'),
                        hintText: 'Comprar víveres'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese motivo de la transeferencia';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    maxLength: 300,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintMaxLines: 3,
                        prefix: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: getIconWidget(IconsAvailables.pen),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Observación'),
                        hintText: 'Observación'),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Se envían 0 imágenes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 13),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.hp(2),
                      ),
                      child: Text(
                        'Registrar',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsive.hp(15.3)),
              ])),
            ],
          ),
        );
      });
    });
  }
}
