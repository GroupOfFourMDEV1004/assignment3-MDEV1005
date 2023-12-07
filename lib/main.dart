
import 'package:assigment3/greeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counter_tool.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Assignment-3',
      routerConfig: _router,
    );
  }
  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: "/", builder: ((context, state) => GreetingPage())),
    GoRoute(path: "/counterTool", builder: ((context, state) => CounterTool()))
    // GoRoute(path: "/secondTool", builder: ((context, state) => const SecondTool()))
  ]);
}


