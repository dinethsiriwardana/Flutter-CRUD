import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_all/firebase/model/model.dart';
import 'package:crud_all/firebase/service/api_path.dart';

abstract class Database {
  Future<void> writeData(String indexno, dataModel dataModel);
  Stream<List<dataModel>> readDataStream();
}

// /data/student_details/2010/
class FirestoreDatabase implements Database {
  FirestoreDatabase();

  Future<void> writeData(String indexno, dataModel dataModel) =>
      _writedataCommon(
        path: APIPath.wdatapath(
            indexno), // ! path create using firebase/service/api_path.dart
        data: dataModel
            .toMap(), // ! Model create using firebase/model/w.data_model.dart
      );

  Future<void> _writedataCommon({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Stream<List<dataModel>> readDataStream() {
    final path = APIPath.rdatapath();
    final reference = FirebaseFirestore.instance
            .collection(path)
            .where('name', isEqualTo: "sDineth")
        // .orderBy('name')
        ;
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => dataModel.fromMap(snapshot.data()))
        .toList());
  }

  Future<void> updateData(String indexno, Map<String, dynamic> data) =>
      _updateData(
        path: APIPath.wdatapath(indexno),
        data: data,
      );

  Future<void> _updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.update(data);
  }

  Future<void> deleteData(String indexno) => _deleteData(
        path: APIPath.wdatapath(indexno),
      );

  Future<void> _deleteData({
    required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }
}
