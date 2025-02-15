import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllScheduleScreen extends StatefulWidget {
  const AllScheduleScreen({super.key});

  @override
  State<AllScheduleScreen> createState() => _AllScheduleScreenState();
}

class _AllScheduleScreenState extends State<AllScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllSchedulePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllSchedulePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
