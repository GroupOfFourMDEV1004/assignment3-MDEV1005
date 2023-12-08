
import 'package:assigment3/greeting_screen.dart';
import 'package:assigment3/widgets/calculator/calculator.dart';
import 'package:assigment3/widgets/sticky_note/sticky_note.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counter_tool.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
    GoRoute(path: "/", builder: ((context, state) => const GreetingPage())),
    GoRoute(path: "/counterTool", builder: ((context, state) => const CounterTool())),
    GoRoute(path: "/calculatorTool", builder: ((context, state) => const CalculatorTool())),
    GoRoute(path: "/notesTool", builder: ((context, state) => const StickyNote()))
  ]);
}


