import 'package:flutter/material.dart';

class ChecklistScreen2 extends StatefulWidget {
  const ChecklistScreen2({super.key});

  @override
  State<ChecklistScreen2> createState() => _ChecklistScreen2State();
}

class _ChecklistScreen2State extends State<ChecklistScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChecklistPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChecklistPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
