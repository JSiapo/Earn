import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/actions/row_actions_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_list_widget.dart';
import 'package:eran_by_saving/widgets/history/list_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget with HomePageAbstract, BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: getclearAppBar(context, toolbarHeight: 0),
        body: SafeArea(
          child: Center(
            child: Consumer<HomeProvider>(
              builder: (context, data, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(responsive.hp(2)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bienvenido de nuevo',
                                          style: TextStyle(
                                            fontSize: responsive.dp(1.3),
                                          ),
                                        ),
                                        Text(
                                          'José Siapo',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: responsive.dp(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                        imageBuilder:
                                            (context, imageProvider) => Badge(
                                          elevation: 1,
                                          showBadge: true,
                                          badgeContent: const Text(
                                            '9',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              goTo(context,
                                                  PAGES.settingsPage.route);
                                            },
                                            child: CircleAvatar(
                                              radius: responsive.wp(7),
                                              backgroundColor:
                                                  Theme.of(context).cardColor,
                                              backgroundImage: imageProvider,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            CircleAvatar(
                                          radius: responsive.wp(7),
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: IconButton(
                                            // color: Colors.white,
                                            visualDensity:
                                                VisualDensity.comfortable,
                                            iconSize: responsive.wp(6),
                                            onPressed: () {
                                              goTo(context,
                                                  PAGES.settingsPage.route);
                                            },
                                            icon: const FaIcon(
                                                FontAwesomeIcons.user),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          radius: responsive.wp(7),
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: IconButton(
                                            // color: Colors.white,
                                            visualDensity:
                                                VisualDensity.comfortable,
                                            iconSize: responsive.wp(6),
                                            onPressed: () {
                                              goTo(context,
                                                  PAGES.settingsPage.route);
                                            },
                                            icon: const FaIcon(
                                                FontAwesomeIcons.user),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    tooltip: "Añadir tarjeta",
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
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(responsive.hp(1.1)),
                              child: const ListActionsWidget(),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(responsive.hp(2)),
                              child: const HistoryList(),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        child: Container(
                          height: null,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          width: responsive.wp(100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              FaIcon(FontAwesomeIcons.cloudArrowUp,
                                  color: Colors.white),
                              Text('Sincroniza tus datos tocando aquí',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        bottom: 0,
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
