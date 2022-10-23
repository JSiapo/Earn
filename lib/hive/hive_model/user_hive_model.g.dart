// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveAdapter extends TypeAdapter<UserHive> {
  @override
  final int typeId = 1;

  @override
  UserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHive(
      id: fields[1] == null ? '' : fields[1] as String,
      name: fields[2] == null ? '' : fields[2] as String,
      image: fields[3] == null ? '' : fields[3] as String,
      firebaseId: fields[4] == null ? '' : fields[4] as String,
      token: fields[5] == null ? '' : fields[5] as String,
      tokenExpiration: fields[6] == null ? '' : fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.isLogged)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.firebaseId)
      ..writeByte(5)
      ..write(obj.token)
      ..writeByte(6)
      ..write(obj.tokenExpiration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
