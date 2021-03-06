import 'package:barcode_widget/barcode_widget.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/show_bottom_alert.dart';
import 'package:eran_by_saving/utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCardPage extends StatelessWidget with BasePage {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: getclearAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: IconButton(
                // color: Colors.white,
                visualDensity: VisualDensity.comfortable,
                iconSize: responsive.wp(5),
                padding: const EdgeInsets.all(3),
                onPressed: () async {
                  await scanQr(context);
                },
                icon: const FaIcon(FontAwesomeIcons.qrcode),
              ),
            )
          ],
        ));
  }
}

Future<void> scanQr(BuildContext context) async {
  String qr = await scanResult();
  if (qr.isUuid) {
    showSnackBar(context, qr);
  } else {
    showSnackBar(context, "No se recibio codigo");
  }
}

Future<String> scanResult() async {
  try {
    String scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#f6d15f", "Cancelar", false, ScanMode.QR);
    return scanResult;
  } catch (e) {
    return "";
  }
}
