import 'package:hive/hive.dart';

import '../model/user.dart';

class UserAdapter extends TypeAdapter<UserModel>{
  @override
  read(BinaryReader reader) {
    return UserModel(name: reader.readString(), image: reader.readString());

  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.image);
  }

}