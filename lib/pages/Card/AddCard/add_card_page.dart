import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCardPage extends StatelessWidget with BasePage {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
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
                  String qr = await scan();
                  if (qr.isUuid) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(qr),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No se recibio codigo"),
                    ));
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.qrcode),
              ),
            )
          ],
        ));
  }
}

Future<String> scan() async {
  try {
    String scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#f6d15f", "Cancelar", false, ScanMode.QR);
    return scanResult;
  } catch (e) {
    return "";
  }
}
