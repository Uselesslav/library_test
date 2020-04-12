import 'package:flutter/material.dart';

class BookAdditionPage extends StatefulWidget {
  @override
  _BookAdditionPageState createState() => _BookAdditionPageState();
}

class _BookAdditionPageState extends State<BookAdditionPage> {
  final TextEditingController _bookAdditionNameTextEditingController =
      TextEditingController();
  final TextEditingController _bookAdditionDescriptionTextEditingController =
      TextEditingController();
  final FocusNode _bookAdditionDescriptionFocusNode = FocusNode();
  final String _bookAdditionNameErrorText = null;
  final String _bookAdditionDescriptionErrorText = null;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Book addition'),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _bookAdditionNameTextEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'The name of the book',
                      errorText: _bookAdditionNameErrorText),
                  onSubmitted: (text) => FocusScope.of(context)
                      .requestFocus(_bookAdditionDescriptionFocusNode)),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Description of the book',
                      errorText: _bookAdditionDescriptionErrorText),
                  focusNode: _bookAdditionDescriptionFocusNode,
                  controller: _bookAdditionDescriptionTextEditingController,
                  textInputAction: TextInputAction.done),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addBook,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  void _addBook() {
    // TODO: To implement it
  }
}
