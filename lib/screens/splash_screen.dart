import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<MovieProvider>().fetchAll();
    Timer(
      const Duration(seconds: 3, milliseconds: 500), 
      (){
        context.go('/onboardingScreen');
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("lib/assets/netflix.json"),
      ),
    );
  }
}