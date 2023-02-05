
import 'package:bloc/bloc.dart';

class PageManager extends Cubit<bool> {
  PageManager() : super(false);

  change(value) => emit(value);
}