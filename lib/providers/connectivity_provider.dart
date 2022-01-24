import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:riot_disaster_recovery_app/util/wifi.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/notConnected_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

class ConnectivityProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool _connected = false;
  bool get connected => _connected;

  startMonitoring() async {
    await init();
    _connectivity.onConnectivityChanged.listen(updateStatus);
  }

  init() async {
    // _connected = await WiFi().isConnected();
    // notifyListeners();

    late ConnectivityResult status;
    try {
      status = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }

    updateStatus(status);
  }

  updateStatus(ConnectivityResult status) async {
    print("Connectivity Result changed $status");
    _connected = status == ConnectivityResult.wifi && await WiFi().isConnected();
    // notifyListeners();
    if (!_connected) {
      WidgetSwitcher().updateWidget(const NotConnectedWidget());
    } else {
      WidgetSwitcher().updateWidget(const HomeWidget());
    }
  }
}