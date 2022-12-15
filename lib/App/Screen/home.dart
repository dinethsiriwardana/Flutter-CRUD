import 'package:crud_all/App/Screen/read.dart';
import 'package:crud_all/App/support/drawer.dart';
import 'package:crud_all/firebase/model/model.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final database = FirestoreDatabase();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter CRUD")),
      drawer: drawer(context),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<titleModel?>(
            future: database.readDocDataStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return data == null
                    ? const Text(
                        "No Data",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            data.title1,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            data.title2,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            data.title3,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      );
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      )),
    );
  }
}
