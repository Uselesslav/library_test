import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/book_addition/page.dart';
import 'package:librarytest/books/bloc.dart';
import 'package:librarytest/books/book.dart';
import 'package:librarytest/books/book_widget.dart';
import 'package:librarytest/books/state.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  Widget _buildUninitializedState() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildLoadedState(List<Book> list) {
    if (list.isEmpty) {
      return Center(
        child: Text('no books'),
      );
    } else {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => BookWidget(list[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case BooksUninitialized:
              return _buildUninitializedState();
              break;
            case BooksLoaded:
              return _buildLoadedState((state as BooksLoaded).books);
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BookAdditionPage())),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
