import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/flashlight_screen.dart';
import 'controllers/flashlight_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashlightController()),
      ],
      child: FlashlightApp(),
    ),
  );
}

class FlashlightApp extends StatelessWidget {
  const FlashlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlashlightScreen(),
    );
  }
}
