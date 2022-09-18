import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/device.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DecryptPage extends StatelessWidget with BasePage {
  const DecryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    DevicePlatform dp = DevicePlatform();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const Expanded(child: SizedBox(), flex: 1),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(responsive.wp(4.0)),
                    child: Lottie.asset(
                      'assets/animations/cpu.json',
                      // 'assets/animations/crypto.json',
                      // fit: BoxFit.fill,
                    ),
                  ),
                  flex: 2,
                ),
                const Expanded(child: SizedBox(), flex: 1),
              ],
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: responsive.wp(100),
                child: FutureBuilder<String>(
                    future: dp.getAppVersion(),
                    builder: (context, snapshot) {
                      return Text(
                        'v${snapshot.data ?? ""}',
                        style: GoogleFonts.lato(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
