enum PAGES {
  decrpytPage,
  homePage,
  redirectPage,
  notificationPage,
  loginPage,
  settingsPage,
  cardPage,
  addcardPage,
  receiptPage,
  receivePage,
  transferPage,
  payPage,
  devicePage,
  moreOptionsPage,
  errorPage,
}

extension PagesExt on PAGES {
  String get route {
    String name = toString().split('.').last;
    return '/${name.substring(0, name.length - 4)}';
  }
}
