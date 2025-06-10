// widgets/custom_grid.dart
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final int count; // 盒子数量
  final Function(int) onTap; // 点击回调（参数为盒子 id）
  final double boxWidth; // 单个盒子宽度（默认 100）
  final double boxHeight; // 单个盒子高度（默认 100）
  final double spacing; // 盒子间距（默认 15）

  const CustomGrid({
    super.key,
    required this.count,
    required this.onTap,
    this.boxWidth = 100,
    this.boxHeight = 100,
    this.spacing = 15,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // 计算每行最大盒子数量（根据容器宽度和盒子+间距总宽度）
        final maxPerRow = (constraints.maxWidth ~/ (boxWidth + spacing)).clamp(1, 5);
        
        return Wrap(
          spacing: spacing, // 水平间距
          runSpacing: spacing, // 垂直间距
          children: List.generate(
            count,
            (index) => _buildBox(context, index + 1, maxPerRow), // id 从 1 开始
          ),
        );
      },
    );
  }

  // 单个盒子的 UI 实现
  Widget _buildBox(BuildContext context, int id, int maxPerRow) {
    return InkWell(
      onTap: () => onTap(id), // 触发外部传入的点击回调
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: boxWidth,
        height: boxHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '盒子 $id',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}