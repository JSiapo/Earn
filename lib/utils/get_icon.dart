import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum IconsAvailables {
  moneyBill,
  lightbulb,
  cloudArrowUp,
  boltLightning,
  droplet,
  wifi,
  fireFlameCurved,
  mobile,
  server,
  peopleArrowsLeftRight,
  userDoctor,
  cartShopping,
  bowlFood,
  taxi,
  ship,
  globe,
  fileInvoiceDollar,
  building,
  creditCard,
  paperPlane,
  moneyBillTransfer,
  commentsDollar,
  message,
  solidMessage,
  dolly,
  cartFlatbed,
  plane,
  user,
  qrcode,
  plus,
  trashCan,
  solidBellSlash,
  solidBell,
  mobileScreen,
  shareNodes,
  palette,
  chevronRight,
  circleInfo,
  wrench,
  arrowRightFromBracket,
  arrowsRotate,
  receipt,
  coins,
  ellipsis,
  visa,
  empty,
  medical,
  online,
  spotify,
  vps,
  gym,
  store,
  tv,
  car,
  food,
  clothes,
  church,
  school,
  other,
  google,
  pen,
  arrowsLeftRight,
  arrowsLeft,
  camera,
  gallery,
}

Widget getIconWidget(IconsAvailables icon, {Color? color}) {
  if (icon == IconsAvailables.moneyBill) {
    return FaIcon(
      FontAwesomeIcons.moneyBill,
      color: color,
    );
  }
  if (icon == IconsAvailables.lightbulb) {
    return FaIcon(
      FontAwesomeIcons.lightbulb,
      color: color,
    );
  }
  if (icon == IconsAvailables.cloudArrowUp) {
    return FaIcon(
      FontAwesomeIcons.cloudArrowUp,
      color: color,
    );
  }
  if (icon == IconsAvailables.boltLightning) {
    return FaIcon(
      FontAwesomeIcons.boltLightning,
      color: color,
    );
  }
  if (icon == IconsAvailables.droplet) {
    return FaIcon(
      FontAwesomeIcons.droplet,
      color: color,
    );
  }
  if (icon == IconsAvailables.wifi) {
    return FaIcon(
      FontAwesomeIcons.wifi,
      color: color,
    );
  }
  if (icon == IconsAvailables.fireFlameCurved) {
    return FaIcon(
      FontAwesomeIcons.fireFlameCurved,
      color: color,
    );
  }
  if (icon == IconsAvailables.mobile) {
    return FaIcon(
      FontAwesomeIcons.mobile,
      color: color,
    );
  }
  if (icon == IconsAvailables.server) {
    return FaIcon(
      FontAwesomeIcons.server,
      color: color,
    );
  }
  if (icon == IconsAvailables.peopleArrowsLeftRight) {
    return FaIcon(
      FontAwesomeIcons.peopleArrowsLeftRight,
      color: color,
    );
  }
  if (icon == IconsAvailables.userDoctor) {
    return FaIcon(
      FontAwesomeIcons.userDoctor,
      color: color,
    );
  }
  if (icon == IconsAvailables.cartShopping) {
    return FaIcon(
      FontAwesomeIcons.cartShopping,
      color: color,
    );
  }
  if (icon == IconsAvailables.bowlFood) {
    return FaIcon(
      FontAwesomeIcons.bowlFood,
      color: color,
    );
  }
  if (icon == IconsAvailables.taxi) {
    return FaIcon(
      FontAwesomeIcons.taxi,
      color: color,
    );
  }
  if (icon == IconsAvailables.ship) {
    return FaIcon(
      FontAwesomeIcons.ship,
      color: color,
    );
  }
  if (icon == IconsAvailables.globe) {
    return FaIcon(
      FontAwesomeIcons.globe,
      color: color,
    );
  }
  if (icon == IconsAvailables.fileInvoiceDollar) {
    return FaIcon(
      FontAwesomeIcons.fileInvoiceDollar,
      color: color,
    );
  }
  if (icon == IconsAvailables.building) {
    return FaIcon(
      FontAwesomeIcons.building,
      color: color,
    );
  }
  if (icon == IconsAvailables.creditCard) {
    return FaIcon(
      FontAwesomeIcons.creditCard,
      color: color,
    );
  }
  if (icon == IconsAvailables.paperPlane) {
    return FaIcon(
      FontAwesomeIcons.paperPlane,
      color: color,
    );
  }
  if (icon == IconsAvailables.moneyBillTransfer) {
    return FaIcon(
      FontAwesomeIcons.moneyBillTransfer,
      color: color,
    );
  }
  if (icon == IconsAvailables.commentsDollar) {
    return FaIcon(
      FontAwesomeIcons.commentsDollar,
      color: color,
    );
  }
  if (icon == IconsAvailables.message) {
    return FaIcon(
      FontAwesomeIcons.message,
      color: color,
    );
  }
  if (icon == IconsAvailables.solidMessage) {
    return FaIcon(
      FontAwesomeIcons.solidMessage,
      color: color,
    );
  }
  if (icon == IconsAvailables.dolly) {
    return FaIcon(
      FontAwesomeIcons.dolly,
      color: color,
    );
  }
  if (icon == IconsAvailables.cartFlatbed) {
    return FaIcon(
      FontAwesomeIcons.cartFlatbed,
      color: color,
    );
  }
  if (icon == IconsAvailables.plane) {
    return FaIcon(
      FontAwesomeIcons.plane,
      color: color,
    );
  }
  if (icon == IconsAvailables.user) {
    return FaIcon(
      FontAwesomeIcons.user,
      color: color,
    );
  }
  if (icon == IconsAvailables.qrcode) {
    return FaIcon(
      FontAwesomeIcons.qrcode,
      color: color,
    );
  }
  if (icon == IconsAvailables.plus) {
    return FaIcon(
      FontAwesomeIcons.plus,
      color: color,
    );
  }
  if (icon == IconsAvailables.trashCan) {
    return FaIcon(
      FontAwesomeIcons.trashCan,
      color: color,
    );
  }
  if (icon == IconsAvailables.solidBellSlash) {
    return FaIcon(
      FontAwesomeIcons.solidBellSlash,
      color: color,
    );
  }
  if (icon == IconsAvailables.solidBell) {
    return FaIcon(
      FontAwesomeIcons.solidBell,
      color: color,
    );
  }
  if (icon == IconsAvailables.mobileScreen) {
    return FaIcon(
      FontAwesomeIcons.mobileScreen,
      color: color,
    );
  }
  if (icon == IconsAvailables.shareNodes) {
    return FaIcon(
      FontAwesomeIcons.shareNodes,
      color: color,
    );
  }
  if (icon == IconsAvailables.palette) {
    return FaIcon(
      FontAwesomeIcons.palette,
      color: color,
    );
  }
  if (icon == IconsAvailables.chevronRight) {
    return FaIcon(
      FontAwesomeIcons.chevronRight,
      color: color,
    );
  }
  if (icon == IconsAvailables.circleInfo) {
    return FaIcon(
      FontAwesomeIcons.circleInfo,
      color: color,
    );
  }
  if (icon == IconsAvailables.wrench) {
    return FaIcon(
      FontAwesomeIcons.wrench,
      color: color,
    );
  }
  if (icon == IconsAvailables.arrowRightFromBracket) {
    return FaIcon(
      FontAwesomeIcons.arrowRightFromBracket,
      color: color,
    );
  }
  if (icon == IconsAvailables.arrowsRotate) {
    return FaIcon(
      FontAwesomeIcons.arrowsRotate,
      color: color,
    );
  }
  if (icon == IconsAvailables.receipt) {
    return FaIcon(
      FontAwesomeIcons.receipt,
      color: color,
    );
  }
  if (icon == IconsAvailables.coins) {
    return FaIcon(
      FontAwesomeIcons.coins,
      color: color,
    );
  }
  if (icon == IconsAvailables.ellipsis) {
    return FaIcon(
      FontAwesomeIcons.ellipsis,
      color: color,
    );
  }
  if (icon == IconsAvailables.visa) {
    return FaIcon(
      FontAwesomeIcons.ccVisa,
      color: color,
    );
  }
  if (icon == IconsAvailables.empty) {
    return FaIcon(
      FontAwesomeIcons.moon,
      color: color,
    );
  }
  if (icon == IconsAvailables.medical) {
    return FaIcon(
      FontAwesomeIcons.kitMedical,
      color: color,
    );
  }
  if (icon == IconsAvailables.online) {
    return FaIcon(
      FontAwesomeIcons.earthAmericas,
      color: color,
    );
  }
  if (icon == IconsAvailables.spotify) {
    return FaIcon(
      FontAwesomeIcons.spotify,
      color: color,
    );
  }
  if (icon == IconsAvailables.vps) {
    return FaIcon(
      FontAwesomeIcons.server,
      color: color,
    );
  }
  if (icon == IconsAvailables.gym) {
    return FaIcon(
      FontAwesomeIcons.dumbbell,
      color: color,
    );
  }
  if (icon == IconsAvailables.store) {
    return FaIcon(
      FontAwesomeIcons.store,
      color: color,
    );
  }
  if (icon == IconsAvailables.tv) {
    return FaIcon(
      FontAwesomeIcons.tv,
      color: color,
    );
  }
  if (icon == IconsAvailables.car) {
    return FaIcon(
      FontAwesomeIcons.car,
      color: color,
    );
  }
  if (icon == IconsAvailables.food) {
    return FaIcon(
      FontAwesomeIcons.utensils,
      color: color,
    );
  }
  if (icon == IconsAvailables.clothes) {
    return FaIcon(
      FontAwesomeIcons.shirt,
      color: color,
    );
  }
  if (icon == IconsAvailables.church) {
    return FaIcon(
      FontAwesomeIcons.church,
      color: color,
    );
  }
  if (icon == IconsAvailables.school) {
    return FaIcon(
      FontAwesomeIcons.school,
      color: color,
    );
  }
  if (icon == IconsAvailables.google) {
    return FaIcon(
      FontAwesomeIcons.google,
      color: color,
    );
  }
  if (icon == IconsAvailables.other) {
    return FaIcon(
      FontAwesomeIcons.sackDollar,
      color: color,
    );
  }

  if (icon == IconsAvailables.pen) {
    return FaIcon(
      FontAwesomeIcons.pencil,
      color: color,
    );
  }
  if (icon == IconsAvailables.arrowsLeft) {
    return FaIcon(
      FontAwesomeIcons.arrowLeft,
      color: color,
    );
  }
  if (icon == IconsAvailables.camera) {
    return FaIcon(
      FontAwesomeIcons.cameraRetro,
      color: color,
    );
  }
  if (icon == IconsAvailables.gallery) {
    return FaIcon(
      FontAwesomeIcons.image,
      color: color,
    );
  }
  return FaIcon(
    FontAwesomeIcons.moneyBill,
    color: color,
  );
}
