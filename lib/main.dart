import 'package:flutter/material.dart';
import 'package:venues/app.dart';
import 'package:venues/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const VenuesApp());
}
