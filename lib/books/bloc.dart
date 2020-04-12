import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/books/event.dart';
import 'package:librarytest/books/state.dart';
import 'package:librarytest/common/book.dart';
import 'package:librarytest/common/book_repository.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._booksRepository);

  final BooksRepository _booksRepository;

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
        yield BooksLoaded(await _loadBooks());
        break;
      case BooksLoaded:
        yield BooksLoaded(await _loadBooks());
        break;
    }
  }

  Future<List<Book>> _loadBooks() => _booksRepository.getList();
}
