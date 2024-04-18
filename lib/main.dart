import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:easy_checkout/data/context.dart';
import 'package:easy_checkout/Theme/theme.dart';
import 'package:easy_checkout/Pages/home_page.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EasyCheckoutContext())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyCheckout',
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage()
    );
  }
}