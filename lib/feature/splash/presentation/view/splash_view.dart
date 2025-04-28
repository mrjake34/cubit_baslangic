import 'dart:async';
import 'package:cubit_baslangic/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cubit_baslangic/product/core/utility/router/app_router.dart'; // Router importu
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; // GoRouter importu

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // 1 saniye sonra Home ekranına yönlendir
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        // Widget ağacında hala var mı diye kontrol et
        context.read<HomeCubit>().getPosts();
        // Alternatif: context.pushReplacement(AppRouter.homePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            context.go(AppRouter.homePath);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 16),
              Text('Uygulama Başlatılıyor...'),
            ],
          ),
        ),
      ),
    );
  }
}
