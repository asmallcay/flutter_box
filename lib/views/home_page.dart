import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/box_provider.dart';
import '../widgets/custom_grid.dart';
import 'box_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('盒子管理器')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 加减控制按钮（逻辑不变）
            _buildControlButtons(context),
            const SizedBox(height: 20),
            // 绿色盒子区域（使用 CustomGrid 组件）
            _buildBoxArea(context),
          ],
        ),
      ),
    );
  }

  // 加减按钮区域（逻辑不变）
  Widget _buildControlButtons(BuildContext context) {
    final boxProvider = Provider.of<BoxProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove, size: 30),
          onPressed: boxProvider.decrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${boxProvider.boxCount}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add, size: 30),
          onPressed: boxProvider.increment,
        ),
      ],
    );
  }

  // 绿色盒子区域（简化为调用 CustomGrid）
  Widget _buildBoxArea(BuildContext context) {
    final boxProvider = Provider.of<BoxProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomGrid(
        count: boxProvider.boxCount,
        onTap: (id) => _navigateToDetail(context, id), // 传递点击回调
      ),
    );
  }

  // 跳转详情页（逻辑不变）
  void _navigateToDetail(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => BoxDetailPage(id: id),
      ),
    );
  }
}