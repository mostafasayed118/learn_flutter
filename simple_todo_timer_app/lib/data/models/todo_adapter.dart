import 'package:hive/hive.dart';

import '../../core/entities/todo.dart';

/// Hand-written [TypeAdapter] for [Todo] (avoids build_runner codegen).
class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      id: fields[0] as String,
      title: fields[1] as String,
      isCompleted: fields[2] as bool? ?? false,
      focusSeconds: fields[3] as int? ?? 0,
      createdAt: fields[4] as DateTime? ?? DateTime.now(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..writeString(obj.id)
      ..writeByte(1)
      ..writeString(obj.title)
      ..writeByte(2)
      ..writeBool(obj.isCompleted)
      ..writeByte(3)
      ..writeInt(obj.focusSeconds)
      ..writeByte(4)
      ..writeInt(obj.createdAt.millisecondsSinceEpoch);
  }
}