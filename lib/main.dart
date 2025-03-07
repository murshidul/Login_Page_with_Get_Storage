import 'package:assignment_twenty/home_page.dart';
import 'package:assignment_twenty/login_page.dart';
import 'package:assignment_twenty/storage_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorageUtils.isFirstTimeLogin() ? DashboardPage() : HomePage(),
    );
  }
}
