import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllRecordsScreen extends StatefulWidget {
  const AllRecordsScreen({super.key});

  @override
  State<AllRecordsScreen> createState() => _AllRecordsScreenState();
}

class _AllRecordsScreenState extends State<AllRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllRecordsPagePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllRecordsPagePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
