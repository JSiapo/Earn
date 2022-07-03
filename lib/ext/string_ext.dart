import 'package:eran_by_saving/utils/get_icon.dart' show getIcon;
import 'package:eran_by_saving/utils/is_valid_uuid.dart' show isUuidValid;
import 'package:flutter/material.dart';

extension UUIDExt on String {
  bool get isUuid {
    return isUuidValid(this);
  }
}

extension ToIcon on String {
  IconData get toIcon {
    return getIcon(this);
  }
}
