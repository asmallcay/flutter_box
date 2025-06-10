import 'package:flutter/foundation.dart';

// 盒子数量状态管理（使用 ChangeNotifier）
class BoxProvider extends ChangeNotifier {
  int _boxCount = 3; // 初始盒子数量（至少1个）

  int get boxCount => _boxCount;

  // 增加盒子
  void increment() {
    _boxCount++;
    notifyListeners(); // 通知状态变更
  }

  // 减少盒子（至少保留1个）
  void decrement() {
    if (_boxCount > 1) {
      _boxCount--;
      notifyListeners();
    }
  }
}