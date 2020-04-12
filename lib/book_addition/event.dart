abstract class BookAdditionEvent {}

class Add extends BookAdditionEvent {
  Add(this.name, this.description, this.onSuccess);

  final String name;
  final String description;
  final Function onSuccess;
}
