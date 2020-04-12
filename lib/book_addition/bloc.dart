import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/book_addition/event.dart';
import 'package:librarytest/book_addition/state.dart';
import 'package:librarytest/common/book_repository.dart';

class BookAdditionBloc extends Bloc<BookAdditionEvent, BookAdditionState> {
  BookAdditionBloc(this._booksRepository);

  final BooksRepository _booksRepository;

  @override
  BookAdditionState get initialState => BookAdditionUninitialized();

  @override
  Stream<BookAdditionState> mapEventToState(BookAdditionEvent event) async* {
    switch (event.runtimeType) {
      case Add:
        yield* _handleAdd(event);
        break;
    }
  }

  Stream<BookAdditionState> _handleAdd(Add add) async* {
    bool nameIsEmpty = add.name.isEmpty;
    bool descriptionIsEmpty = add.description.isEmpty;
    if (nameIsEmpty || descriptionIsEmpty) {
      yield BookAdditionInvalid(nameIsEmpty, descriptionIsEmpty);
    } else {
      yield BookAdditionLoading();
      await _addBookToList(add.name, add.description);
      add.onSuccess();
    }
  }

  Future<void> _addBookToList(String name, String description) {
    return _booksRepository.addBook(name, description);
  }
}
