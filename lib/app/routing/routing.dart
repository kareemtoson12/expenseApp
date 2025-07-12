import 'package:expense/app/di/injection_container.dart';
import 'package:expense/domain/usecase/exprense_usecase.dart';
import 'package:expense/presentation/auth/login/login_view.dart';
import 'package:expense/presentation/home/cubit/expense_cubit.dart';
import 'package:expense/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/splash/splash_view.dart';
import '../../presentation/onboarding/onboarding_view.dart';
import '../../presentation/auth/signup/signup_view.dart';
import 'routes.dart';
import 'package:expense/presentation/home/all_expenses_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => ExpenseCubit(
            clearAllExpensesUseCase: sl<ClearAllExpenses>(),
            addExpenseUseCase: sl<AddExpense>(),
            getAllExpensesUseCase: sl<GetAllExpenses>(),
            deleteExpenseUseCase: sl<DeleteExpense>(),
            updateExpenseUseCase: sl<UpdateExpense>(),
          )..init(), // ⬅️  دالة واحدة تُحمّل prefs ثم المصروفات بالترتيب
          child: const HomeScreen(),
        ),
      );

    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginView());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case '/all_expenses':
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => ExpenseCubit(
            clearAllExpensesUseCase: sl<ClearAllExpenses>(),
            addExpenseUseCase: sl<AddExpense>(),
            getAllExpensesUseCase: sl<GetAllExpenses>(),
            deleteExpenseUseCase: sl<DeleteExpense>(),
            updateExpenseUseCase: sl<UpdateExpense>(),
          )..init(),
          child: const AllExpensesScreen(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Unknown Route'))),
      );
  }
}
