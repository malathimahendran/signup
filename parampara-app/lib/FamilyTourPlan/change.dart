import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Change extends ChangeNotifier {
  final receivedIndex;
  Change({this.receivedIndex});

  int a = 0;
  bFun() {
    a++;
    print(a);
    notifyListeners();
  }
}
