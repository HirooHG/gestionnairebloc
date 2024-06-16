import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_g.g.dart';

@JsonSerializable()
class PasswordG extends HiveObject {
  String pwd;

  PasswordG({required this.pwd});
  PasswordG.empty() : pwd = "";

  factory PasswordG.fromJson(Map<String, dynamic> json) =>
      _$PasswordGFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordGToJson(this);

  @override
  bool operator ==(Object other) {
    return pwd == (other as PasswordG).pwd && box == other.box;
  }
  
  @override
  int get hashCode => int.tryParse(key) ?? 0;
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
    return PasswordG(pwd: reader.read());
  }
}
