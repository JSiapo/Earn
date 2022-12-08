import 'dart:ui';

import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/get_card_desing.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class PayServicePage extends StatelessWidget with BasePage {
  const PayServicePage({Key? key}) : super(key: key);

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
                leading: IconButton(
                  onPressed: () {
                    goBack(context);
                  },
                  icon: getIconWidget(IconsAvailables.chevronLeft,
                      size: 20, color: Colors.white),
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
                      color: Colors.black12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      // height: 80,
                      width: responsive.wp(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'PAGAR',
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
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Aqui se registran los pagos que se realizan con la cuenta, ya sea a entiedades o comercios, se puede adjuntar hasta 5 imágenes como evidencia de la operación ya sea una foto o una captura de pantalla a la boleta, recibo u operación bancaria',
                    style: GoogleFonts.lato(
                        fontSize: 13, fontStyle: FontStyle.italic),
                  ),
                ),
                // const Divider(),
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
