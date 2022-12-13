class dataModel {
  dataModel({
    required this.index,
    required this.name,
    required this.age,
    required this.gender,
  });
  final int index;
  final String name;
  final int age;
  final String gender;

  factory dataModel.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      throw AssertionError('data must not be null');
    }
    final String name = data['name'];
    final int age = data["age"];
    final int index = data["index"];
    final String gender = data["gender"];
    return dataModel(name: name, age: age, gender: gender, index: index);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "age": age,
      "index": index,
      "gender": gender,
    };
  }
}
