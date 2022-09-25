import 'package:eran_by_saving/utils/is_valid_uuid.dart' show isUuidValid;

extension UUIDExt on String {
  bool get isUuid {
    return isUuidValid(this);
  }
}
