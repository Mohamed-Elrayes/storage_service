import 'package:flutter/material.dart';
import 'package:flutter_application_1/min_fram/service/storage/storage.dart';
import 'package:flutter_application_1/src/core/adapters/local_user_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'min_fram/bynd.dart';
import 'min_fram/widgets/navigation.dart';

final localUser = LocalUserModel()
  ..id = 0
  ..name = "mo";

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await StorageLocalManager.instance.initialize();

  $Bynd.$StorageContainer.secureKey.put("secure data");
  $Bynd.$StorageContainer.boxA.put("data");
  $Bynd.$StorageContainer.boxB.put(localUser);

  runApp(const MainApp());
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final m = $Bynd.$StorageContainer;
    return MaterialApp(
      navigatorKey: NavKey.navKey,
      home: Scaffold(
          body: Column(
        children: [
          Text('${m.boxA.get()}'),
          Text(m.boxB.get()!.name.toString()),
          Text('${m.secureKey.get()}'),
        ],
      )),
    );
  }
}
