import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavebarNotifire extends StateNotifier<int> {
  NavebarNotifire() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final navbarProvider = StateNotifierProvider<NavebarNotifire, int>(
  (_) => NavebarNotifire(),
);
