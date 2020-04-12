import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/book_addition/state.dart';

import 'event.dart';

class BookAdditionBloc extends Bloc<BookAdditionEvent, BookAdditionState> {
  @override
  BookAdditionState get initialState => BookAdditionInput('', '');

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
      await _addBookToList();
      add.onSuccess();
      yield BookAdditionInput('', '');
    }
  }

  Future<void> _addBookToList() {
    // TODO: Implement
    return Future.delayed(Duration(seconds: 1));
  }
}
