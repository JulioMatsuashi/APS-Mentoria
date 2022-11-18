import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tccfacul/firebase_options.dart';
import 'package:tccfacul/pages/initial_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Olá Mundo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue.shade900),
      home: const InitalPage(),
    );
  }
}
