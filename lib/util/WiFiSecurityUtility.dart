import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class WiFiSecurityUtility {
  static void checkAndShowAlertDialog(BuildContext context) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Check if connected to an unsecured WiFi network
      bool isUnsecuredWiFi = await isWiFiUnsecured();
      if (isUnsecuredWiFi) {
        // Show alert dialog
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Unsecured WiFi Detected'),
            content: const Text('You are connected to an unsecured WiFi network.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  static Future<bool> isWiFiUnsecured() async {
    final info = NetworkInfo();
    final wifiBSSID = await info.getWifiBSSID();
    // info.
    return true;
  }
}
