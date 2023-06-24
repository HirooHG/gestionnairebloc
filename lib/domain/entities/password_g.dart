import 'package:hive/hive.dart';

class PasswordG extends HiveObject {

  String pwd;

  PasswordG({
    required this.pwd
  });
  PasswordG.empty() :
        pwd = "";

  Map<String, String> toMap() {
    return {"pwd": pwd};
  }

  @override
  bool operator ==(Object other) {
    return pwd == (other as PasswordG).pwd
        && box == other.box;
  }
}
class PasswordGTypeAdapter extends TypeAdapter<PasswordG> {

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, PasswordG obj) {
    writer.write(obj.pwd);
  }

  @override
  PasswordG read(BinaryReader reader) {
    return PasswordG(
      pwd: reader.read()
    );
  }
}
