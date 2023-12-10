import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class NetworkConnection {
  Connectivity netWorkConnectivity = Connectivity();

  Future<void> checkConnection(BuildContext context) async {
    ConnectivityResult result = await netWorkConnectivity.checkConnectivity();

    checkStatus(result, context);
    netWorkConnectivity.onConnectivityChanged.listen((event) {
      checkStatus(event, context);
    });
  }

  void checkStatus(ConnectivityResult result, BuildContext context) {
    if (result.index == 3) {
      context.read<HomeProvider>().changeStatus(true);
      print("InterNet is on");
    } else {
      context.read<HomeProvider>().changeStatus(false);
      print("InterNet is off");
    }
  }
}
