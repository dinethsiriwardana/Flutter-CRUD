import 'package:crud_all/App/support/drawer.dart';
import 'package:crud_all/firebase/crud_fn/read_fn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class readData extends StatefulWidget {
  const readData({super.key});

  @override
  State<readData> createState() => _readDataState();
}

class _readDataState extends State<readData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter")),
      drawer: drawer(context),
      body: Column(
        children: [
          readdata(),
        ],
      ),
    );
  }
}
