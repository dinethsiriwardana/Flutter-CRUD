import 'package:crud_all/App/Screen/read.dart';
import 'package:crud_all/App/support/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter CRUD")),
      drawer: drawer(context),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Flutter + Firebase",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "CRUD",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "Sample App",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      )),
    );
  }
}
