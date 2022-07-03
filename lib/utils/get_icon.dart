import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:eran_by_saving/ext/string_ext.dart' show ToIcon;

IconData getIcon(String name) {
  if (name == "moneyBill") return FontAwesomeIcons.moneyBill;
  if (name == "lightbulb") return FontAwesomeIcons.lightbulb;
  if (name == "cloudArrowUp") return FontAwesomeIcons.cloudArrowUp;
  if (name == "boltLightning") return FontAwesomeIcons.boltLightning;
  if (name == "droplet") return FontAwesomeIcons.droplet;
  if (name == "wifi") return FontAwesomeIcons.wifi;
  if (name == "fireFlameCurved") return FontAwesomeIcons.fireFlameCurved;
  if (name == "mobile") return FontAwesomeIcons.mobile;
  if (name == "server") return FontAwesomeIcons.server;
  if (name == "peopleArrowsLeftRight") {
    return FontAwesomeIcons.peopleArrowsLeftRight;
  }
  if (name == "userDoctor") return FontAwesomeIcons.userDoctor;
  if (name == "cartShopping") return FontAwesomeIcons.cartShopping;
  if (name == "bowlFood") return FontAwesomeIcons.bowlFood;
  if (name == "taxi") return FontAwesomeIcons.taxi;
  if (name == "ship") return FontAwesomeIcons.ship;
  if (name == "globe") return FontAwesomeIcons.globe;
  if (name == "fileInvoiceDollar") return FontAwesomeIcons.fileInvoiceDollar;
  if (name == "building") return FontAwesomeIcons.building;
  return FontAwesomeIcons.moneyBill;
}
