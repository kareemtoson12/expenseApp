import 'package:flutter/material.dart';
import 'routing/routing.dart';
import 'routing/routes.dart';

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      initialRoute: AppRoutes.splash,
      onGenerateRoute: generateRoute,
    );
  }
}
