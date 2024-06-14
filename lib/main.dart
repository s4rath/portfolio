import 'package:flutter/material.dart';


import 'screens/main_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      home: PageStorage(
        bucket: bucket,
        child: const MainDashBoard(),
      ),
    );
  }
}
