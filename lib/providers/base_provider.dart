import 'package:flutter/widgets.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}