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

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reversi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  String? _reversed; // Changed to nullable String to handle uninitialized state

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Reverse'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter string to reverse"),
            ),
            const SizedBox(height: 10.0),
            if (_reversed !=
                null) // Display _reversed only if it is initialized
              Text(
                _reversed!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text("Reverse"),
              onPressed: () {
                if (_controller.text.isEmpty) return;
                setState(() {
                  _reversed = reverseString(_controller.text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String reverseString(String initial) {
  return initial.split('').reversed.join();
}