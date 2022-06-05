// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsHiveAdapter extends TypeAdapter<SettingsHive> {
  @override
  final int typeId = 0;

  @override
  SettingsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsHive(
      isDark: fields[0] == null ? true : fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
