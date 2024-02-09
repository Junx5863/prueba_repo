// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<String> titleList = ['Home', 'Android', 'Blog', 'Envato'];
  final int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            checkPermission(Permission.locationAlways, context);
          },
          child: const Text('Check Permission'),
        ),
      ),
    );
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission is Granted")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission is not Granted")));
    }
  }
}
