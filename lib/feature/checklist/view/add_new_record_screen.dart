import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddNewRecordScreen extends StatefulWidget {
  const AddNewRecordScreen({super.key});

  @override
  State<AddNewRecordScreen> createState() => _AddNewRecordScreenState();
}

class _AddNewRecordScreenState extends State<AddNewRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNewRecordPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddNewRecordPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
