import 'package:flutter/material.dart';

class AllAdkarScreen extends StatefulWidget {
  const AllAdkarScreen({super.key});

  @override
  State<AllAdkarScreen> createState() => _AllAdkarScreenState();
}

class _AllAdkarScreenState extends State<AllAdkarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار'),
      ),
    );
  }
}
