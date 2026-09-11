import 'package:flutter/material.dart';
import 'package:x_app/Router/app_router.dart';

class X_APP extends StatelessWidget {
  const X_APP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'X',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
