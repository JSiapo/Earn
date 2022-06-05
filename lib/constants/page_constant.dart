//! Add page in ext file on pages_ext.dart

enum PAGES {
  homePage,
  configPage,
}

extension PagesExt on PAGES {
  String get route {
    String name = toString().split('.').last;
    return '/${name.substring(0, name.length - 4)}';
  }
}
