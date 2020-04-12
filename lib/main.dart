import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/bloc.dart';
import 'package:librarytest/books/event.dart';

import 'books/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => BooksBloc()..add(Fetch()),
          child: BooksPage(),
        ));
  }
}
