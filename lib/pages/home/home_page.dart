import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RealWorld'),
        actions: const [
          // HINT: AppBar 오른쪽에 위젯을 배치하고 싶은 경우 여기에 추가하면 됩니다.
        ],
      ),
      body: const Center(
        child: Text('/home'),
      ),
    );
  }
}