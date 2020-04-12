import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/book_addition/bloc.dart';
import 'package:librarytest/book_addition/event.dart';
import 'package:librarytest/book_addition/state.dart';

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
  String _bookAdditionNameErrorText;
  String _bookAdditionDescriptionErrorText;

  BookAdditionBloc get _bookAdditionBloc => BlocProvider.of(context);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Book addition'),
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<BookAdditionBloc, BookAdditionState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case BookAdditionUninitialized:
                _bookAdditionNameErrorText = null;
                _bookAdditionDescriptionErrorText = null;
                return _getBookAdditionWidget();
                break;
              case BookAdditionInvalid:
                if ((state as BookAdditionInvalid).bookNameIsNotValid) {
                  _bookAdditionNameErrorText = 'Введите название';
                } else {
                  _bookAdditionNameErrorText = null;
                }
                if ((state as BookAdditionInvalid).bookDescriptionIsNotValid) {
                  _bookAdditionDescriptionErrorText = 'Введите описание';
                } else {
                  _bookAdditionDescriptionErrorText = null;
                }
                return _getBookAdditionWidget();
                break;
              case BookAdditionLoading:
                return Center(child: CircularProgressIndicator());
                break;
            }
          },
        ),
        floatingActionButton: _getAddBookWidget(),
      );

  Widget _getBookAdditionWidget() => Padding(
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
      );

  Widget _getAddBookWidget() => FloatingActionButton(
        onPressed: () => _addBook(_bookAdditionNameTextEditingController.text,
            _bookAdditionDescriptionTextEditingController.text),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      );

  void _addBook(String name, String description) {
    _bookAdditionBloc.add(Add(name, description, () => Navigator.pop(context)));
  }
}
