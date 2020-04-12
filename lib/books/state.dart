import 'package:librarytest/common/book.dart';

abstract class BooksState {}

class BooksUninitialized extends BooksState {}

class BooksLoaded extends BooksState {
  BooksLoaded(this.books);

  final List<Book> books;
}
