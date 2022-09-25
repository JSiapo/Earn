import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/pages/Loading/loading_page.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/widgets/actions/row_actions_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_list_widget.dart';
import 'package:eran_by_saving/widgets/history/list_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageAbstract, BasePage {
  @override
  void initState() {
    super.initState();
    final isEmptyCards = context.read<CardProvider>().cards.isEmpty;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isEmptyCards) {
        context.read<CardProvider>().refresh(context);
        goTo(context, PAGES.addcardPage.route);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    // Responsive responsive = Responsive(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: getclearAppBar(context, toolbarHeight: 0),
          body: SafeArea(
            child: Consumer<HomeProvider>(
              builder: (context, data, _) {
                return Stack(
                  children: [
                    const HomePageWidget(),
                    if (context.watch<LoadingProvider>().isLoading)
                      const LoadingPage(),
                    // Positioned(
                    //   child: AnimatedOpacity(
                    //     duration: const Duration(seconds: 1),
                    //     opacity: 1,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         print("sincronizar");
                    //       },
                    //       child: Container(
                    //         padding: const EdgeInsets.symmetric(vertical: 13),
                    //         decoration: const BoxDecoration(
                    //             color: Colors.red,
                    //             borderRadius: BorderRadius.only(
                    //               topRight: Radius.circular(10),
                    //               topLeft: Radius.circular(10),
                    //             )),
                    //         width: responsive.wp(100),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             const FaIcon(FontAwesomeIcons.cloudArrowUp,
                    //                 color: Colors.white),
                    //             Text('Sincroniza tus datos tocando aquí',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: GoogleFonts.lato(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                 )),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   bottom: 0,
                    // ),
                  ],
                );
              },
            ),
          )),
    );
  }

  @override
  String setTitle() {
    return "Home Basic";
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 100),
            height: responsive.hf(1 / 10),
            child: Padding(
              padding: EdgeInsets.all(responsive.hp(2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenido(a) de nuevo',
                          style: GoogleFonts.roboto(
                            fontSize: responsive.dp(1.3),
                          ),
                        ),
                        Text(
                          'José Siapo',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.dp(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Hero(
                        tag: 'profile',
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          imageBuilder: (context, imageProvider) => Badge(
                            elevation: 1,
                            showBadge: true,
                            badgeContent: const Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                goTo(context, PAGES.settingsPage.route);
                              },
                              child: CircleAvatar(
                                // radius: responsive.wp(7),
                                maxRadius: responsive.isLandscape
                                    ? responsive.wp(4)
                                    : responsive.wp(7),
                                minRadius: responsive.wp(3),
                                backgroundColor: Theme.of(context).cardColor,
                                backgroundImage: imageProvider,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => CircleAvatar(
                            radius: responsive.wp(7),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: IconButton(
                              // color: Colors.white,
                              visualDensity: VisualDensity.comfortable,
                              iconSize: responsive.wp(6),
                              onPressed: () {
                                goTo(context, PAGES.settingsPage.route);
                              },
                              icon: getIconWidget(IconsAvailables.user),
                            ),
                          ),
                          errorWidget: (context, url, error) => CircleAvatar(
                            radius: responsive.wp(7),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: IconButton(
                              // color: Colors.white,
                              visualDensity: VisualDensity.comfortable,
                              iconSize: responsive.wp(6),
                              onPressed: () {
                                goTo(context, PAGES.settingsPage.route);
                              },
                              icon: getIconWidget(IconsAvailables.user),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: responsive.isLandscape ? 250 : 190),
            height: responsive.hp(28),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      constraints: const BoxConstraints(
                          // maxHeight: 350, maxWidth: 450),
                          maxHeight: 750,
                          maxWidth: 450),
                      height: responsive.isLandscape
                          ? responsive.hp(75)
                          : responsive.hp(25), // 25
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
                    icon: getIconWidget(IconsAvailables.plus),
                  )
                ],
              ),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: responsive.isLandscape ? 140 : 100),
            height: responsive.hp(14),
            child: Padding(
              padding: EdgeInsets.all(responsive.hp(1)),
              child: const ListActionsWidget(),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: responsive.isLandscape ? 390 : 80),
            height: responsive.hp(39),
            child: Padding(
              padding:
                  EdgeInsets.all(responsive.hp(responsive.isLandscape ? 8 : 3)),
              child: const HistoryList(),
            ),
          ),
        ],
      ),
    );
  }
}
