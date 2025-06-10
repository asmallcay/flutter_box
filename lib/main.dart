import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/box_provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => BoxProvider(), // 注册状态管理
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '前端测试',
      theme: ThemeData(
        primarySwatch: Colors.green, // 主题色为绿色
      ),
      home: const HomePage(),
    );
  }
}