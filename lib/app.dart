import 'package:flutter/material.dart';
import 'package:venues/service/routers.service.dart';

class VenuesApp extends StatelessWidget {
  const VenuesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutersService.getInstance().router,
    );
  }
}
