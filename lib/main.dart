import 'package:flutter/material.dart';
import 'package:librarytest/dependencies.dart';

void main() {
  GraphDependencies graphDependencies = GraphDependencies();

  runApp(App(graphDependencies.getBooksWidget()));
}

class App extends StatelessWidget {
  App(this._homePageBuilder);

  final WidgetBuilder _homePageBuilder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: _homePageBuilder).build(context),
    );
  }
}
