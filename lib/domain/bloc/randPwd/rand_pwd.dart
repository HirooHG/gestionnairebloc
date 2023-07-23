import 'dart:math';

import 'package:bloc/bloc.dart';

final letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
final signs = ["&", "#", "{", "[", "(", "|", "-", "@", ")", "]", "}", "=", "+", "£", "%", "?", "!", "r"];
final numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

class RandomPwd extends Cubit<String> {
  RandomPwd() : super("");

  String _randomPwd() {
    final tabs = [letters, signs, numbers ];
    String pwd = "";
    const length = 15;

    do {
      pwd = "";

      for(var i = 0; i < length; i++) {
        var tab = _randomThing(tabs);
        var letter = _randomThing(tab);
        pwd += letter;
      }

    } while(!_verif(pwd, tabs));

      return pwd;
  }

  bool _verif(String word, List<List<String>> tabs) {
    for(var i in tabs) {
      if(!word.split("").any((e) => i.any((element) => element == e))) {
        return false;
      }
    }
    return true;
  }

  T _randomThing<T>(List<T> tab) {
    Random rand = Random();

    return tab[rand.nextInt(tab.length)];
  }

  void gen() {
    emit(_randomPwd());
  }
}
