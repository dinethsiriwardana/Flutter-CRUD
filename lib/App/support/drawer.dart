import 'package:crud_all/App/Screen/delete.dart';
import 'package:crud_all/App/Screen/home.dart';
import 'package:crud_all/App/Screen/read.dart';
import 'package:crud_all/App/Screen/update.dart';
import 'package:crud_all/App/Screen/write.dart';
import 'package:flutter/material.dart';

Drawer drawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Flutter\nCRUD',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text('READ'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const readData(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box_rounded),
          title: Text('WRITE'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const writeData(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.update),
          title: Text('UPDATE'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const updateData(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('DELETE'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const deleteData(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
