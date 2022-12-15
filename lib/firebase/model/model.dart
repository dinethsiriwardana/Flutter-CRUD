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

// For the Home page
class titleModel {
  titleModel({
    required this.title1,
    required this.title2,
    required this.title3,
  });
  final String title1;
  final String title2;
  final String title3;

  factory titleModel.fromMap(Map<String, dynamic> data) {
    String title1 = data['title1'] ?? "";
    String title2 = data['title2'] ?? "";
    String title3 = data['title3'] ?? "";
    return titleModel(title1: title1, title2: title2, title3: title3);
  }
}
