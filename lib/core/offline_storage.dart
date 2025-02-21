import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService<T> {
  final String key;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  StorageService(
      {required this.key, required this.fromJson, required this.toJson});

  Future<void> saveList(List<T> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((item) => jsonEncode(toJson(item))).toList();
    await prefs.setStringList(key, jsonList);
  }

  Future<List<T>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(key) ?? [];
    return jsonList.map((json) => fromJson(jsonDecode(json))).toList();
  }

  Future<void> addItem(T item) async {
    List<T> currentList = await getList();
    currentList.add(item);
    await saveList(currentList);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
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
