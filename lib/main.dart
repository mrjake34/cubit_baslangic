import 'package:cubit_baslangic/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cubit_baslangic/product/core/utility/dependency/dependency_manager.dart';
import 'package:cubit_baslangic/product/core/utility/router/app_router.dart';
import 'package:cubit_baslangic/product/core/utility/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DependencyManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
