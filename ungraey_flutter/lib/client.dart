import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ungraey_client/ungraey_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// When you are running the app on a physical device, you need to set the
// server URL to the IP address of your computer. You can find the IP
// address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
//
// You can set the variable when running or building your app like this:
// E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.
//
// Otherwise, the server URL is fetched from the assets/config.json file or
// defaults to http://$localhost:8080/ if not found.
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late final SessionManager sessionManager;

final serverUrl = getServerUrl();

Future<void> initializeClient() async {
  String url = await serverUrl;
  if (Platform.isAndroid && url.contains('localhost')) {
    url = url.replaceAll('localhost', '10.0.2.2');
  }
  
  client = Client(url)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authKeyProvider = FlutterAuthenticationKeyManager();
    
  sessionManager = SessionManager(caller: client.modules.auth);
  sessionManager.initialize().catchError((e) {
    debugPrint('Failed to initialize session manager: $e');
  });
}
