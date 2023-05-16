import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/welcome_dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions options;

  if (kIsWeb) {
    options = FirebaseOptions(
      appId: "1:847718638877:web:d6233c78ec0b00e12a6df4",
      messagingSenderId: "847718638877",
      projectId: "multi-vendor-app-9fba7",
      databaseURL:
          'https://ncg-shopping-app-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: "multi-vendor-app-9fba7.appspot.com",
      apiKey: "AIzaSyDHbWTdE5VflGocEguN1MHR6v4h_4nUD3c",
    );
  } else {
    options = FirebaseOptions(
      appId: "1:847718638877:web:d6233c78ec0b00e12a6df4",
      messagingSenderId: "847718638877",
      projectId: "multi-vendor-app-9fba7",
      databaseURL:
          'https://ncg-shopping-app-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: "multi-vendor-app-9fba7.appspot.com",
      apiKey: "AIzaSyDHbWTdE5VflGocEguN1MHR6v4h_4nUD3c",
    );
  }

  await Firebase.initializeApp(options: options);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Vendor Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeDashBoard(),
      //adding an initial route after completion of the login screen
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Multi Vendor Application'),
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
