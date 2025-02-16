import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddNewScheduleScreen extends StatefulWidget {
  const AddNewScheduleScreen({super.key});

  @override
  State<AddNewScheduleScreen> createState() => _AddNewScheduleScreenState();
}

class _AddNewScheduleScreenState extends State<AddNewScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNewSchedulePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddNewSchedulePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
