enum PAGES {
  decrpytPage,
  homePage,
  settingsPage,
  cardPage,
  addcardPage,
}

extension PagesExt on PAGES {
  String get route {
    String name = toString().split('.').last;
    return '/${name.substring(0, name.length - 4)}';
  }
}
