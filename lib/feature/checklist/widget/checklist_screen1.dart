import 'package:flutter/material.dart';

class ChecklistScreen1 extends StatefulWidget {
  const ChecklistScreen1({super.key});

  @override
  State<ChecklistScreen1> createState() => _ChecklistScreen1State();
}

class _ChecklistScreen1State extends State<ChecklistScreen1> {
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
