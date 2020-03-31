import 'package:flutter/material.dart';
import 'package:librarytest/books/book.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(this._book) : super();
  final Book _book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_book.name),
      isThreeLine: false,
      subtitle: Text(_book.description),
      dense: false,
    );
  }
}
