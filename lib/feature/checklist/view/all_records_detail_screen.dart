import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllRecordsDetailScreen extends StatefulWidget {
  const AllRecordsDetailScreen({super.key});

  @override
  State<AllRecordsDetailScreen> createState() => _AllRecordsDetailScreenState();
}

class _AllRecordsDetailScreenState extends State<AllRecordsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllRecordsDetailPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllRecordsDetailPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
