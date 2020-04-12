import 'package:librarytest/common/book.dart';

class BooksRepository {
  final List<Book> _list = [];

  Future<List<Book>> getList() async {
    await _delay();
    return Future.value(_list);
  }

  Future<void> addBook(String name, String description) async {
    await _delay();
    _list.add(Book(name, description));
  }

  // simulation delay of the server or database
  Future _delay() {
    return Future.delayed(Duration(seconds: 1));
  }
}
