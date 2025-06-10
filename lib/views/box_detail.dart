import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage() // auto_route 标记页面
class BoxDetailPage extends StatelessWidget {
  const BoxDetailPage({
    super.key,
    @pathParam required this.id, // 从路由参数中获取 id
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('盒子 $id 详情')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '盒子 $id 专属内容',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '这是盒子 $id 的详细信息（id=$id）',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.popRoute(), // auto_route 返回上一页
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text('返回主页面', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}