import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/cardBank/card_list_widget.dart';
import 'package:eran_by_saving/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget with HomePageAbstract {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[800],
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Consumer<HomeProvider>(
              builder: (context, data, _) {
                return Column(
                  children: [
                    FancyButton(
                      callback: () {
                        goTo(context, PAGES.settingsPage.route);
                      },
                      text: "PAGE: ${data.indexCard}",
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 350, maxWidth: 400),
                            height: responsive.hp(25),
                            width: responsive.wp(85),
                            child: CardList(data.indexCard),
                          ),
                        ),
                        IconButton(
                          // color: Colors.white,
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.plus),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }

  @override
  String setTitle() {
    return "Home Basic";
  }
}
