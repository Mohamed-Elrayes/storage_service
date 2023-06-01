import 'package:bynd/bynd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/local_container.dart';
import 'package:flutter_application_1/src/core/storage/adapters/local_user_model.dart';


final localUser = LocalUserModel()
  ..id = 0
  ..name = "mo";

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// initialize
  List<BoxService> boxes = $StorageContainer.initializerBoxes;
  await $Bynd.localStorageManager.initialize(boxes);

  $StorageContainer.secureKey.put("secure data");
  $StorageContainer.boxA.put("data");
  $StorageContainer.boxB.put(false);
  $StorageContainer.adapterUser.put(localUser);

  runApp(const MainApp());
  // FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final m = $StorageContainer;
    return MaterialApp(
      navigatorKey: $Bynd.navigationKey,
      home: Scaffold(
          body: Column(
        children: [
          Text('${m.boxA.get()}'),
          Text('${m.adapterUser.get()?.name}'),
          Text(m.boxB.get().toString()),
          Text('${m.secureKey.get()}'),
          ElevatedButton(
              onPressed: () => $Bynd.to(Scaffold(
                    appBar: AppBar(),
                    body: const Center(
                      child: Text("new screen"),
                    ),
                  )),
              child: const Text("data"))
        ],
      )),
    );
  }
}
