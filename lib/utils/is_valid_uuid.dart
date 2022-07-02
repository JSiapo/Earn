export 'package:eran_by_saving/ext/string_ext.dart' show UUIDExt;

final uuidRegex =
    RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[0-9a-f]{4}-[0-9a-f]{12}$');

bool isUuidValid(String value) {
  return uuidRegex.hasMatch(value);
}
