import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/cardBank/card_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget with HomePageAbstract, BasePage {
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(responsive.hp(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bienvenido José',
                              style: TextStyle(
                                fontSize: responsive.dp(2),
                              ),
                            ),
                            IconButton(
                              // color: Colors.white,
                              visualDensity: VisualDensity.comfortable,
                              iconSize: responsive.wp(5),
                              padding: const EdgeInsets.all(3),
                              onPressed: () {
                                goTo(context, PAGES.settingsPage.route);
                              },
                              icon: const FaIcon(FontAwesomeIcons.user),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 350, maxWidth: 450),
                                height: responsive.hp(25),
                                width: responsive.wp(75),
                                child: const CardList(),
                              ),
                            ),
                            IconButton(
                              // color: Colors.white,
                              visualDensity: VisualDensity.comfortable,
                              iconSize: responsive.wp(5),
                              padding: const EdgeInsets.all(3),
                              onPressed: () {
                                goTo(context, PAGES.addcardPage.route);
                              },
                              icon: const FaIcon(FontAwesomeIcons.plus),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
