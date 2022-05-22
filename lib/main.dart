import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/routes.dart';
import 'package:virtual_shark_tank/pages/addInnovationPage.dart';
import 'package:virtual_shark_tank/pages/home/root.dart';
import 'package:virtual_shark_tank/pages/innovationPage.dart';
import 'package:virtual_shark_tank/pages/loginPage.dart';
import 'package:virtual_shark_tank/pages/onboardingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: AppRoutes.login,
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      AppRoutes.login: (context) => LoginPage(),
      AppRoutes.onboarding: (context) => OnboardingPage(),
      AppRoutes.root: (context) => RootPage(),
      AppRoutes.innovation: (context) => InnovationPage(),
      AppRoutes.addInnovation: (context) => AddInnovationPage(),
    },
  ));
}
