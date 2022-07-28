import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';

class ReceiptPage extends StatelessWidget with BasePage {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: getclearAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: FaIcon("boltLightning".toIcon),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Hidrandina',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(height: 15),
                const Opacity(
                  opacity: 0.7,
                  child: Text(
                    "Pago de servicio",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                    ),
                    textScaleFactor: 1.1,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "S./75.00",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Pago de servicio mensual de luz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ListView(
                      children: [
                        const ListTile(
                          title: Text('Fecha'),
                          trailing: Text('02/07/2022'),
                        ),
                        const ListTile(
                          title: Text('Categoría'),
                          trailing: Text('Pago de servicio'),
                        ),
                        ListTile(
                          title: const Text('Identificador'),
                          trailing: Text(
                              '#${"4859b7f2-3c67-4dd3-b477-3f760c7972a0".substring(31)}'),
                        ),
                        const ListTile(
                          title: Text('Tarjeta'),
                          trailing: Text('****4455'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showCustomDialog(
                                context,
                                PhotoView(
                                  // backgroundDecoration: const BoxDecoration(
                                  //   color: Colors.white,
                                  // ),
                                  minScale:
                                      PhotoViewComputedScale.contained * 0.8,
                                  imageProvider:
                                      const CachedNetworkImageProvider(
                                    "https://noticiasresponsables.com/wp-content/uploads/2019/07/Hidrandina.jpg",
                                  ),
                                ),
                                size: responsive.hp(70));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://noticiasresponsables.com/wp-content/uploads/2019/07/Hidrandina.jpg",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCustomDialog(
                                context,
                                PhotoView(
                                  minScale:
                                      PhotoViewComputedScale.contained * 0.8,
                                  imageProvider:
                                      const CachedNetworkImageProvider(
                                    "https://noticiasresponsables.com/wp-content/uploads/2020/07/Hidrandina-1299x1536.jpg",
                                  ),
                                ),
                                size: responsive.hp(70));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://noticiasresponsables.com/wp-content/uploads/2020/07/Hidrandina-1299x1536.jpg",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCustomDialog(
                                context,
                                PhotoView(
                                  minScale:
                                      PhotoViewComputedScale.contained * 0.8,
                                  imageProvider:
                                      const CachedNetworkImageProvider(
                                    "https://www.rumbominero.com/wp-content/uploads/2019/02/hidrandina-invertira-93-millones-de-soles-para-mejorar-servicio-electrico-principalmente-en-trujillo.jpg",
                                  ),
                                ),
                                size: responsive.hp(70));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://www.rumbominero.com/wp-content/uploads/2019/02/hidrandina-invertira-93-millones-de-soles-para-mejorar-servicio-electrico-principalmente-en-trujillo.jpg",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   child: const Text('text'),
                  //   onPressed: () {},
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
