import 'package:flutter/material.dart';
import 'package:flutter_for_learning/book_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookListSample',
      home: BookListPage(),
    );
  }
}
