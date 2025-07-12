import 'package:expense/data/local_db/Expense_local_db.dart';
import 'package:expense/data/repo_impl/expense_repo_impl.dart';
import 'package:expense/domain/models/expense_model.dart';
import 'package:expense/domain/repo/exprense_repo.dart' show ExpenseRepository;
import 'package:expense/domain/usecase/exprense_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../data/api/auth_api_service.dart';
import '../../presentation/auth/signup/signup_cubit.dart';
import '../../presentation/auth/login/login_cubit.dart';
import '../../data/constants.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });

  // API Services
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiService(sl<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  // Cubits
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(apiService: sl<AuthApiService>()),
  );

  sl.registerFactory<LoginCubit>(
    () => LoginCubit(apiService: sl<AuthApiService>()),
  );

  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());

  sl.registerLazySingleton<ExpenseLocalDataSource>(
    () => ExpenseLocalDataSource(),
  );
  sl.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(sl()),
  );
  // di/injection_container.dart
  sl.registerLazySingleton<AddExpense>(() => AddExpense(sl()));
  sl.registerLazySingleton<GetAllExpenses>(() => GetAllExpenses(sl()));
  sl.registerLazySingleton<DeleteExpense>(() => DeleteExpense(sl()));
  sl.registerLazySingleton<UpdateExpense>(() => UpdateExpense(sl()));
  sl.registerLazySingleton<ClearAllExpenses>(() => ClearAllExpenses(sl()));
}
