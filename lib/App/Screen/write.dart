import 'package:crud_all/App/support/drawer.dart';
import 'package:crud_all/firebase/model/model.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class writeData extends StatefulWidget {
  const writeData({super.key});

  @override
  State<writeData> createState() => _writeDataState();
}

class _writeDataState extends State<writeData> {
  final TextEditingController _indexNoController = TextEditingController();
  final FocusNode _indexNoFocusNode = FocusNode();
  int get _index => int.parse(_indexNoController.text);

  final TextEditingController _fnameController = TextEditingController();
  final FocusNode _fnameFocusNode = FocusNode();
  String get _fname => _fnameController.text;

  final TextEditingController _ageController = TextEditingController();
  final FocusNode _ageFocusNode = FocusNode();
  int get _age => int.parse(_ageController.text);

  final TextEditingController _genderController = TextEditingController();
  final FocusNode _genderFocusNode = FocusNode();
  String get _gender => _genderController.text;

  bool _isindexfilled = true;
  bool _isfnamefilled = true;
  bool _isagefilled = true;
  bool _isgenderfilled = true;

  Future<void> _writeData(BuildContext context) async {
    //! Use provider to connect with Database Class in service/database.dart
    final database = FirestoreDatabase();

    //! input -> wDataModel (Fro map) -> database -> writeData
    await database.writeData(
      "$_index", //! for create path
      dataModel(
          name: _fname,
          age: _age,
          gender: _gender,
          index: _index), //! Send input data to wDataModel  to Map
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
            const SizedBox(
              height: 20,
            ),
            textInput(_fnameController, _fnameFocusNode, _isfnamefilled,
                ['Enter your Name', 'Name Required'], false),
            const SizedBox(
              height: 20,
            ),
            textInput(_ageController, _ageFocusNode, _isagefilled,
                ['Enter your Age', 'Age Required'], false),
            const SizedBox(
              height: 20,
            ),
            textInput(_genderController, _genderFocusNode, _isgenderfilled,
                ['Enter your Gender', 'Gender Required'], false),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _writeData(context),
                child: const Text("Submit"))
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
