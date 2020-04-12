import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/bloc.dart';
import 'package:librarytest/books/book_widget.dart';
import 'package:librarytest/books/event.dart';
import 'package:librarytest/books/state.dart';
import 'package:librarytest/common/book.dart';

class BooksPage extends StatefulWidget {
  BooksPage(this._bookAdditionPageBuilder);

  final WidgetBuilder _bookAdditionPageBuilder;

  @override
  _BooksPageState createState() => _BooksPageState(_bookAdditionPageBuilder);
}

class _BooksPageState extends State<BooksPage> {
  _BooksPageState(this._bookAdditionPageBuilder);

  final WidgetBuilder _bookAdditionPageBuilder;

  BooksBloc get _booksBloc => BlocProvider.of(context);

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
      floatingActionButton: _getButtonAddBook(),
    );
  }

  Widget _buildUninitializedState() =>
      Center(child: CircularProgressIndicator());

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

  Widget _getButtonAddBook() => FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: _bookAdditionPageBuilder,
            ),
          );
          _booksBloc.add(Fetch());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      );
}
