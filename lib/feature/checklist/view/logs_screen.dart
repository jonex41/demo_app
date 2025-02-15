import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogsPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LogsPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
