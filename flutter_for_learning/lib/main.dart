import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_screen.dart';
import 'providers/todo_provider.dart';
import 'utilities/initialize_database.dart';

void main() async {
  // runApp()を呼び出す前にFlutter Engineの機能を利用したい場合に必要
  WidgetsFlutterBinding.ensureInitialized();
  // DBの準備
  final database = await initializeDatabase();
  runApp(
    MultiProvider( // providerの定義
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(database: database),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite demo',
      home: HomeScreen.withDependencies(context: context),
    );
  }
}
