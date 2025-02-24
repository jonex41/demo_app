import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final String key;

  LocalStorageService({required this.key});

  Future<void> saveList(List<Map<String, dynamic>> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(items);
    await prefs.setString(key, jsonString);
  }

  Future<List<Map<String, dynamic>>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(jsonString));
  }

  Future<void> addItem(Map<String, dynamic> item) async {
    final list = await getList();
    list.add(item);
    await saveList(list);
  }

  Future<void> deleteItem(String value) async {
    final list = await getList();
    list.removeWhere((item) => item["myUniqueId"] == value);
    await saveList(list);
  }
    Future<void> deleteAll() async {
    //final list = await getList();
  //  list.removeWhere((item) => item["myUniqueId"] == value);
    await saveList([]);
  }
}

//use cases
/* 
final storage = StorageService<Person>(
  key: "person_list",
  fromJson: (json) => Person.fromJson(json),
  toJson: (person) => person.toJson(),
);

void savePeople() async {
  List<Person> people = [
    Person(name: "Alice", age: 25),
    Person(name: "Bob", age: 30),
  ];
  await storage.saveList(people);
}

void addPerson() async {
  await storage.addItem(Person(name: "Charlie", age: 28));
}

void getPeople() async {
  List<Person> people = await storage.getList();
  people.forEach((p) => print("${p.name} is ${p.age} years old"));
}
 */
