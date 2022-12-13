import 'package:crud_all/App/Screen/write.dart';
import 'package:crud_all/firebase/model/model.dart';
import 'package:crud_all/firebase/service/database.dart';
import 'package:flutter/material.dart';

readdata() {
  final database = FirestoreDatabase();

  return StreamBuilder<List<dataModel>>(
      stream: database.readDataStream(), //! Read Data (database.dart)
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final rdata = snapshot.data!.toList();

            if (rdata.isEmpty) {
              return const Center(
                child: Text("No Data"),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: rdata.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10),
                  color: Colors.grey[200],
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rdata[index].index.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rdata[index].name,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rdata[index].age.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          rdata[index].gender.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Has Some error"),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}
