import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/books_bloc.dart';
import 'package:librarytest/books/books_event.dart';

import 'books/books_widget.dart';

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
