
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/vehicle_overview_screen.dart';
import 'screens/admin_dashboard_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KFZ Verwaltung',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const LoginScreen(),
      routes: {
        '/vehicles': (_) => const VehicleOverviewScreen(),
        '/admin': (_) => const AdminDashboardScreen(),
      },
    );
  }
}
