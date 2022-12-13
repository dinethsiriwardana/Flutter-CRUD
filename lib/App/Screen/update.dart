import 'package:crud_all/App/support/drawer.dart';
import 'package:crud_all/firebase/model/model.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class updateData extends StatefulWidget {
  const updateData({super.key});

  @override
  State<updateData> createState() => _updateDataState();
}

class _updateDataState extends State<updateData> {
  final TextEditingController _indexNoController = TextEditingController();
  final FocusNode _indexNoFocusNode = FocusNode();
  int get _index => int.parse(_indexNoController.text);

  final TextEditingController _updateDataController = TextEditingController();
  final FocusNode _updateDataFocusNode = FocusNode();
  dynamic get _updateData => _updateDataController.text;

  bool _isindexfilled = true;

  // Initial Selected Value
  String dropdownvalue = 'index';

  // List of items in our dropdown menu
  var items = [
    'index',
    'name',
    'age',
    'gender',
  ];

  Future<void> updateUser(BuildContext context) async {
    //! Use provider to connect with Database Class in service/database.dart
    final database = FirestoreDatabase();

    // //! input -> wDataModel (Fro map) -> database -> writeData
    await database.updateData(
      "$_index", //! for create path
      {"$dropdownvalue": _updateData},
    );
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
            SizedBox(
              height: 20,
            ),
            dropdownInput(),
            SizedBox(
              height: 20,
            ),
            textInput(_updateDataController, _updateDataFocusNode,
                _isindexfilled, ['Update ', 'Update Required'], false),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => updateUser(context),
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }

  SizedBox dropdownInput() {
    return SizedBox(
      width: 300,
      height: 55.0,
      child: DropdownButtonFormField(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
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
