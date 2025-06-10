// app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/box_detail_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: BoxDetailPage, path: '/box/:id'), // 动态路由
  ],
)
class AppRouter extends _$AppRouter {}