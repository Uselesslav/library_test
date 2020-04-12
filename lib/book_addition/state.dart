abstract class BookAdditionState {}

class BookAdditionUninitialized extends BookAdditionState {}

class BookAdditionInvalid extends BookAdditionState {
  BookAdditionInvalid(this.bookNameIsNotValid, this.bookDescriptionIsNotValid);

  final bool bookNameIsNotValid;
  final bool bookDescriptionIsNotValid;
}
