import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/book.dart';
import 'package:librarytest/books/books_event.dart';
import 'package:librarytest/books/books_state.dart';

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
        yield BooksLoaded([
          Book('first book', 'description of the first book'),
          Book('second book', 'description of the second book')
        ]);
        break;
      case BooksLoaded:
        yield state;
        break;
    }
  }
}
