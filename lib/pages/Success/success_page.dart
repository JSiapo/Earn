import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/provider/success_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SuccessPage extends StatelessWidget with BasePage {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Consumer<HomeProvider>(
      builder: (context, data, _) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: data.settings.isDark
              ? const Color.fromARGB(255, 54, 141, 39)
              : const Color.fromARGB(255, 69, 182, 44),
          appBar: AppBar(
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: data.settings.isDark
                  ? const Color.fromARGB(255, 54, 141, 39)
                  : const Color.fromARGB(255, 69, 182, 44),

              statusBarIconBrightness: data.settings.isDark
                  ? Brightness.light
                  : Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          // appBar: getclearAppBar(context, toolbarHeight: 0),
          body: Consumer<SuccessProvider>(
            builder: (context, successProvider, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(responsive.wp(0.0)),
                    child: Lottie.asset(
                      'assets/animations/success.json',
                      // 'assets/animations/ufo.json',
                      fit: BoxFit.fill,
                    ),
                  ),
                  flex: 3,
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        successProvider.messages.join(' '),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                // ...errorProvider.errors
                //     .map((e) => Padding(
                //           padding: const EdgeInsets.all(18.0),
                //           child: Text(e,
                //               style: GoogleFonts.lato(color: Colors.white)),
                //         ))
                //     .toList(),
                const Expanded(child: SizedBox()),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          surfaceTintColor: data.settings.isDark
                              ? const Color.fromARGB(255, 21, 21, 21)
                              : const Color.fromARGB(255, 255, 255, 247),
                        ),
                        onPressed: () {
                          if (successProvider.isRedirectPage) {
                            goTo(context, successProvider.redirectSuccess.route,
                                replace: true);
                            successProvider.reset();
                          } else {
                            successProvider.reset();
                            if (successProvider.isBack) goBack(context);
                          }
                        },
                        child: SizedBox(
                          width: responsive.wp(70),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text('Aceptar',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(fontSize: 18)),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
