import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import '';
class GoRouterRefreshStream extends ChangeNotifier{
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;


@override
void dispose(){
  _subscription.cancel();
  super.dispose();

}
}