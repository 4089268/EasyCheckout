import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/data/easycheckout_context.dart';
import 'package:easy_checkout/Theme/theme.dart';
import 'package:easy_checkout/Pages/home_page.dart';
import 'package:easy_checkout/data/invoice_provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EasyCheckoutContext()),
        ChangeNotifierProvider(create: (_) => InvoiceProvider())
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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}