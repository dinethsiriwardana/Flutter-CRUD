import 'package:crud_all/App/support/drawer.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class deleteData extends StatefulWidget {
  const deleteData({super.key});

  @override
  State<deleteData> createState() => _deleteDataState();
}

class _deleteDataState extends State<deleteData> {
  final TextEditingController _indexNoController = TextEditingController();
  final FocusNode _indexNoFocusNode = FocusNode();
  int get _index => int.parse(_indexNoController.text);

  bool _isindexfilled = true;

  Future<void> deleteData(BuildContext context) async {
    //! Use provider to connect with Database Class in service/database.dart
    final database = FirestoreDatabase();

    // //! input -> wDataModel (Fro map) -> database -> writeData
    await database.deleteData("$_index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter CRUD")),
      drawer: drawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textInput(_indexNoController, _indexNoFocusNode, _isindexfilled,
                ['Enter your Index', 'Index Required'], false),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => deleteData(context),
                child: const Text("Delete"))
          ],
        ),
      ),
    );
  }

  SizedBox textInput(
    TextEditingController controller,
    FocusNode focusNode,
    bool isfilled,
    List<String> textlist,
    bool obscureText,
  ) {
    return SizedBox(
      width: 300,
      height: 55.0,
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        focusNode: focusNode,
        onTap: () {
          isfilled = false;
          setState(() {});
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          labelText: !isfilled ? textlist[1] : textlist[0],
          hintText: textlist[0],
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            color: !isfilled ? Colors.red : Colors.black,
          ),
        ),
        onChanged: (email) => _updateState(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}
