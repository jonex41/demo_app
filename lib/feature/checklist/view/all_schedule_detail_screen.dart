import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllScheduleDetailScreen extends StatefulWidget {
  const AllScheduleDetailScreen({super.key});

  @override
  State<AllScheduleDetailScreen> createState() =>
      _AllScheduleDetailScreenState();
}

class _AllScheduleDetailScreenState extends State<AllScheduleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllScheduleDetailPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllScheduleDetailPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
