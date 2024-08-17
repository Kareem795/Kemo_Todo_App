import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/UI/Screen/Home/home.dart';
import 'package:project_todo/ui/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCoaAaKVt-LpXgiI0zX4-EGL86iUKhZzt8",
        appId:  "1:232783999538:android:034ad412a2070abdce822b",
        messagingSenderId: "todo-project-8fc2c",
        projectId: "todo-project-8fc2c"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: App_Theme.light,
      darkTheme: App_Theme.Dark,
      routes: {
        HomeScreen.routeNamed: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeNamed,
    );
  }
}
