import 'package:finli_app/pages/home_page.dart';
import 'package:finli_app/pages/login_page.dart';
import 'package:finli_app/pages/main_page.dart';
import 'package:finli_app/pages/onboarding_page.dart';
import 'package:finli_app/pages/register_page.dart';
import 'package:finli_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finli_app/bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
