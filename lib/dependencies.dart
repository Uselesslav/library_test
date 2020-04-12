import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarytest/book_addition/bloc.dart';
import 'package:librarytest/book_addition/page.dart';
import 'package:librarytest/books/bloc.dart';
import 'package:librarytest/books/event.dart';
import 'package:librarytest/books/page.dart';
import 'package:librarytest/common/book_repository.dart';

// TODO: Use ioc
class GraphDependencies {
  final BooksRepository _booksRepository = BooksRepository();

  WidgetBuilder getBookAdditionWidget() => (context) => BlocProvider(
        create: (context) => BookAdditionBloc(_booksRepository),
        child: BookAdditionPage(),
      );

  WidgetBuilder getBooksWidget() => (context) => BlocProvider(
        // TODO: Remove Fetch command from here
        create: (context) => BooksBloc(_booksRepository)..add(Fetch()),
        child: BooksPage(
          getBookAdditionWidget(),
        ),
      );
}
