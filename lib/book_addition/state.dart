abstract class BookAdditionState {}

class BookAdditionInput extends BookAdditionState {
  BookAdditionInput(this.name, this.description);

  final String name;
  final String description;
}

class BookAdditionInvalid extends BookAdditionState {
  BookAdditionInvalid(this.bookNameIsNotValid, this.bookDescriptionIsNotValid);

  final bool bookNameIsNotValid;
  final bool bookDescriptionIsNotValid;
}
