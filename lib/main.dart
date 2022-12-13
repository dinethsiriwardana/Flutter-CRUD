import 'package:crud_all/App/Screen/home.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:crud_all/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const providerClass(),
    );
  }
}

class providerClass extends StatelessWidget {
  const providerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Database>(
      create: (_) => FirestoreDatabase(),
      child: HomePage(),
    );
  }
}
