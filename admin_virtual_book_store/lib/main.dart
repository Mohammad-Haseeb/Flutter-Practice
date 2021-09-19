

import 'package:flutter/material.dart';
 import 'package:admin_virtual_book_store/Register.dart';
 import 'package:admin_virtual_book_store/Screens/main_screen.dart';
  import 'package:firebase_core/firebase_core.dart';
 import 'package:admin_virtual_book_store/Screens/login.dart';
 import 'package:admin_virtual_book_store/Screens/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Container(
              child: Text("Error"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            // theme: ThemeData(
            //   primaryColor: Colors.black26,
            // ),
            home:MainScreen() ,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Container(
            child: Text("Loading"),
          ),
        );
      },
    );
  }
}