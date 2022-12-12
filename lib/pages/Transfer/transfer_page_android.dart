// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Transfer/transfer_page.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/confirm_dialog.dart';
import 'package:eran_by_saving/utils/get_card_desing.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/get_images.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/show_dialog.dart';
import 'package:eran_by_saving/utils/two_decimals.dart';
import 'package:eran_by_saving/widgets/actions/slide_to_confirm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class TransferPageAndroid extends StatefulWidget with BasePage {
  const TransferPageAndroid({Key? key}) : super(key: key);

  @override
  State<TransferPageAndroid> createState() => _TransferPageAndroidState();
}

class _TransferPageAndroidState extends State<TransferPageAndroid> {
  final List<XFile> _imageFileList = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late NavigatorState _navigator;

  // @override
  // void didChangeDependencies() {
  //   _navigator = Navigator.of(context);
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext tcontext) {
    Responsive responsive = Responsive(tcontext);
    return TransferPage(
      child: Consumer<HomeProvider>(builder: (context, dataHome, _) {
        return Consumer<CardProvider>(builder: (context, data, _) {
          return Scaffold(
            key: _scaffoldKey,
            floatingActionButton: SpeedDial(
              labelsBackgroundColor:
                  dataHome.settings.isDark ? Colors.black : Colors.white,
              speedDialChildren: <SpeedDialChild>[
                SpeedDialChild(
                  child: getIconWidget(IconsAvailables.camera),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  label: 'Cámara',
                  onPressed: () async {
                    try {
                      var pickedImages = await getImages(true);
                      if (pickedImages != null) {
                        setState(() {
                          _imageFileList.addAll(
                              pickedImages.take(5 - _imageFileList.length));
                        });
                      }
                    } catch (e) {
                      //
                    }
                  },
                ),
                SpeedDialChild(
                  child: getIconWidget(IconsAvailables.gallery),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow,
                  label: 'Galería',
                  onPressed: () async {
                    try {
                      var pickedImages = await getImages(false);
                      if (pickedImages != null) {
                        setState(() {
                          _imageFileList.addAll(
                              pickedImages.take(5 - _imageFileList.length));
                        });
                      }
                    } catch (e) {
                      //
                    }
                  },
                ),
              ],
              child: getIconWidget(IconsAvailables.gallery),
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      goBack(context);
                    },
                    icon: getIconWidget(IconsAvailables.chevronLeft,
                        size: 20, color: Colors.white),
                  ),
                  backgroundColor: Colors.grey[850],
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(
                        color: Colors.black12,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        // height: 80,
                        width: responsive.wp(100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'TRANSFERIR',
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${data.card?.name}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    titlePadding: const EdgeInsets.all(0),
                    centerTitle: true,
                    background: getCardDesign(data.card),
                    stretchModes: const [
                      StretchMode.blurBackground,
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Aqui se registran transeferencias a otras PERSONAS o uso de aplicaciones como YAPE, PLIN o similares, puede enviar hasta 5 imágenes o capturas de pantalla como evidencia de la operación. Como por ejemplo, transferir a encargado de compras para comprar pan en el supermercado',
                      style: GoogleFonts.lato(
                          fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2),
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          prefix: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: getIconWidget(IconsAvailables.moneyBill)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Monto'),
                          hintText: '0.00'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese monto inicial de cuenta';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefix: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: getIconWidget(IconsAvailables.user),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Persona a transferir'),
                          hintText: 'Nombre de persona a transferir'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese nombre de la persona a transferir';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      maxLength: 100,
                      decoration: InputDecoration(
                          prefix: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: getIconWidget(IconsAvailables.pen),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Motivo'),
                          hintText: 'Comprar víveres'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese motivo de la transeferencia';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      maxLength: 300,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintMaxLines: 3,
                          prefix: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: getIconWidget(IconsAvailables.pen),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Observación'),
                          hintText: 'Observación'),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      _imageFileList.isNotEmpty
                          ? 'Se envía(n) ${_imageFileList.length} imágen(es)'
                          : 'Ninguna imágen seleccionada',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(fontSize: 13),
                    ),
                  ),
                  if (_imageFileList.isNotEmpty)
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          key: UniqueKey(),
                          itemCount: _imageFileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showCustomDialog(
                                          context,
                                          PhotoView(
                                            minScale: PhotoViewComputedScale
                                                    .contained *
                                                0.8,
                                            maxScale: PhotoViewComputedScale
                                                    .contained *
                                                1.8,
                                            imageProvider: FileImage(
                                              File(_imageFileList[index].path),
                                            ),
                                          ),
                                          size: responsive.hp(70));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        File(_imageFileList[index].path),
                                        height: 130,
                                        width: 130,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      child: GestureDetector(
                                        onTap: () {
                                          confirmDialog(
                                              _scaffoldKey.currentContext ??
                                                  context, () {
                                            Navigator.pop(
                                                _scaffoldKey.currentContext ??
                                                    context);
                                            setState(() {
                                              _imageFileList.removeAt(index);
                                            });
                                          }, () {
                                            Navigator.pop(
                                                _scaffoldKey.currentContext ??
                                                    context);
                                          },
                                              title: "ELIMINAR",
                                              message:
                                                  "Seguro desea eliminar la imagen #${index + 1}");
                                        },
                                        child: Container(
                                          color: Colors.black87,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 130,
                                            height: 33,
                                            child: getIconWidget(
                                              IconsAvailables.trashCan,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    width: 130,
                                    height: 32,
                                    bottom: 2,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  SizedBox(height: responsive.hp(2.3)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        surfaceTintColor:
                            context.read<HomeProvider>().settings.isDark
                                ? const Color.fromARGB(255, 21, 21, 21)
                                : const Color.fromARGB(255, 255, 255, 247),
                      ),
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enableDrag: true,
                            context: _scaffoldKey.currentContext ?? context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: responsive.hp(40),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Datos de Operación',
                                          style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Monto',
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              '${data.card!.currency} 3000.20',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.lato(
                                                  fontSize: 14),
                                            ),
                                            width: responsive.wp(60),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Persona',
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              'Juan Carlos Paredes Tinedo',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.lato(
                                                  fontSize: 14),
                                            ),
                                            width: responsive.wp(60),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Motivo',
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              'Recarga Movistar',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.lato(
                                                  fontSize: 14),
                                            ),
                                            width: responsive.wp(60),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Observación',
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              'Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla Ninguna observación bla bla bla bla bla',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.lato(
                                                  fontSize: 14),
                                              maxLines: 3,
                                            ),
                                            width: responsive.wp(60),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Imánges',
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              '5 Adjuntas',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.lato(
                                                  fontSize: 14),
                                            ),
                                            width: responsive.wp(60),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Consumer<LoadingProvider>(
                                          builder: (context,
                                              loadingDataProvider, _) {
                                            return Consumer<ErrorProvider>(
                                              builder: (context,
                                                  errorDataProvider, _) {
                                                return ConfirmationSlider(
                                                  width: responsive.wp(60),
                                                  height: responsive.hp(7),
                                                  onConfirmation: () async {
                                                    try {
                                                      goBack(tcontext);
                                                      loadingDataProvider
                                                          .setLoading(true);
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1500));

                                                      loadingDataProvider
                                                          .setLoading(false);
                                                      goBack(tcontext);
                                                    } catch (e) {
                                                      loadingDataProvider
                                                          .setLoading(false);
                                                      errorDataProvider
                                                          .addError("$e");
                                                    }
                                                  },
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 21, 109, 37),
                                                  text: 'Confirmar',
                                                  textStyle: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: responsive.hp(2),
                        ),
                        child: Text(
                          'Registrar',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.hp(15.3)),
                ])),
              ],
            ),
          );
        });
      }),
    );
  }
}
