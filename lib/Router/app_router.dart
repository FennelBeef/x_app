import 'package:go_router/go_router.dart';
import 'package:x_app/Pages/country.dart';
import 'package:x_app/Pages/homePage.dart';
import 'package:x_app/Pages/login.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Login()),
    GoRoute(path: '/country', builder: (context, state) => const country()),
    GoRoute(path: '/homePage', builder: (context, state) => const HomePage()),
  ],
);
