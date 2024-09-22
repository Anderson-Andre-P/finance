import 'package:finance/common/constants/app_routes.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStoage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Olá, mundo!"),
            ElevatedButton(
              onPressed: () {
                _secureStoage.deleteOne(key: "CURRENT_USER").then(
                      (_) => Navigator.popAndPushNamed(
                          context, NamedRoute.initial),
                    );
              },
              child: const Text(
                "Log Out",
              ),
            )
          ],
        ),
      ),
    );
  }
}
