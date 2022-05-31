import 'package:flutter/material.dart';

class NavigationUtil {
  // ._()：シングルトン？
  // シングルトン：実行時に１つのインスタンスしか生成しないクラス。どこから呼んでも同じステートになる。
  NavigationUtil._();
  static final instance = NavigationUtil._();

  final homeNavigatorKey = GlobalKey<NavigatorState>();

  final androidNavigatorKey = GlobalKey<NavigatorState>();
  final backpackNavigatorKey = GlobalKey<NavigatorState>();
  final cakeNavigatorKey = GlobalKey<NavigatorState>();

  /// HOME画面まで戻る
  void popUntilHome() {
    homeNavigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<T?> pushHomeNavigator<T>({required Widget page}) async {
    return _pushNavigator(key: homeNavigatorKey, page: page);
  }

  Future<T?> pushAndroidNavigatorAndRemoveUntilFirstPage<T>({required Widget page}) async {
    return _pushNavigatorAndRemoveUntilFirstPage(key: androidNavigatorKey, page: page);
  }

  Future<T?> _pushNavigator<T>({
    required GlobalKey<NavigatorState> key,
    required Widget page,
  }) async {
    return key.currentState?.push<T>(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  Future<T?> _pushNavigatorAndRemoveUntilFirstPage<T>({
    required GlobalKey<NavigatorState> key,
    required Widget page,
  }) async {
    // pushAndRemoveUntil：第２引数でtrueが返されるまで以前のルートを全て削除する
    return key.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => route.isFirst,
    );
  }
}
