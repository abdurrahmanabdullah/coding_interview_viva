
///--flutter   lifecycle  ////////////////////////////
///  1----initstate is called only once when the widget is created,
///  2---didChangeDependencies()  is called after the initState() and can call multiple time  If any of these dependencies change — for instance, if the theme is updated or if the device orientation changes — didChangeDependencies() is called again to ensure the widget updates to reflect these new values.
///  3-- didupdatewidget  called whenever the widget configuration change  when you pass a duration for animation controller
///  4-- deactivate() called when objet is removed from the tree  do not dispose here.when moving the widget in the widget tree using globalkey
///  5--dispose()     called when objet is removed from the tree permanently

///-- flutter package//plugin/ flutter modules //
///package=> package can add new functionality available to flutter || do not need any native code ||all code in dart
///plugin=>is also special kind of package ||in which u can have native code ||camera, url_launcher, shared_preferences, connectivity.
/// modules => module used to integrated flutter with existing native application | Use modules when you have an existing native app and want to add Flutter features without fully migrating the app to Flutter.

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',

      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
