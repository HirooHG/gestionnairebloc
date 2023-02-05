
import 'package:hive/hive.dart';

class Password extends HiveObject with Comparable {

  String website;
  String identifier;
  String pwd;

  Password({
    required this.website,
    required this.identifier,
    required this.pwd
  });
  Password.empty() :
      website = "",
      identifier = "",
      pwd = "";

  Map<String, String> toMap() {
    return {"website": website, "identifier": identifier, "pwd": pwd};
  }

  @override
  int compareTo(other) {
    return website.compareTo((other as Password).website);
  }
}
class PasswordTypeAdapter extends TypeAdapter<Password> {

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Password obj) {
    writer.write({
      "website": obj.website,
      "identifier": obj.identifier,
      "pwd": obj.pwd
    });
  }

  @override
  Password read(BinaryReader reader) {
    var map = reader.readMap();
    return Password(
      website: map["website"],
      identifier: map["identifier"],
      pwd: map["pwd"]
    );
  }
}
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