import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/book.dart';
import 'package:librarytest/books/event.dart';
import 'package:librarytest/books/state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  @override
  BooksState get initialState => BooksUninitialized();

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {
    switch (event.runtimeType) {
      case Fetch:
        yield* _handleFetch(state);
        break;
    }
  }

  Stream<BooksState> _handleFetch(BooksState state) async* {
    switch (state.runtimeType) {
      case BooksUninitialized:
        // TODO: Use real data
        yield BooksLoaded(_loadBooks());
        break;
      case BooksLoaded:
        yield BooksLoaded(_loadBooks());
        break;
    }
  }

  List<Book> _loadBooks() => [
        Book('first book', 'description of the first book'),
        Book('second book', 'description of the second book')
      ];
}
