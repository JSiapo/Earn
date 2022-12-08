import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/pages/Loading/loading_page.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:eran_by_saving/provider/user_provider.dart';
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
                          context.read<UserProvider>().user?.name ?? "",
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
                              context.read<UserProvider>().user?.image ?? "",
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
                      showModalBottomSheet(
                          backgroundColor:
                              context.read<HomeProvider>().settings.isDark
                                  ? null
                                  : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enableDrag: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: responsive.hp(40),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Elige tu banco',
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: responsive.hp(30),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: BankListWidet(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                      // goTo(context, PAGES.addcardPage.route);
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

class BankListWidet extends StatelessWidget {
  const BankListWidet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, _) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: ["BCP", "BBVA", "INTERBANK", "SCOTIABANK", "AGORA"]
            .map((e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 5,
                    color: data.settings.isDark
                        ? const Color.fromARGB(188, 66, 66, 66)
                        : const Color.fromARGB(255, 253, 253, 238),
                    surfaceTintColor: data.settings.isDark
                        ? const Color.fromARGB(255, 21, 21, 21)
                        : const Color.fromARGB(255, 252, 252, 236),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: getIconWidget(IconsAvailables.bank),
                        trailing: getIconWidget(IconsAvailables.chevronRight),
                        title: Text(e, style: GoogleFonts.lato()),
                        subtitle: Text('Tiene 3 diseños disponibles',
                            style: GoogleFonts.lato()),
                        onTap: () {
                          Navigator.pop(context);
                          goTo(context, PAGES.addcardPage.route);
                        },
                      ),
                    ),
                  ),
                ))
            .toList(),
      );
    });
  }
}
