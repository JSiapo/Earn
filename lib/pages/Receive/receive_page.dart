import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/getCardDesing.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class ReceivePage extends StatelessWidget with BasePage {
  const ReceivePage({Key? key}) : super(key: key);

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
                  title: Container(
                    color: Colors.black38,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    // height: 80,
                    width: responsive.wp(100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'INGRESO',
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
                    '',
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ),
              ])),
            ],
          ),
        );
      });
    });
  }
}
