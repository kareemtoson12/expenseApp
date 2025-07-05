import 'package:flutter/material.dart';
import 'app/expense_app.dart';
import 'app/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ExpenseApp());
}
