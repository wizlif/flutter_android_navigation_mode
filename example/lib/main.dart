import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeviceNavigationMode _navigationMode = DeviceNavigationMode.none;

  @override
  void initState() {
    super.initState();
    initNavigationMode();
  }

  Future<void> initNavigationMode() async {
    DeviceNavigationMode navigationMode;
    try {
      navigationMode = await AndroidNavigationMode.getNavigationMode;
    } catch (e) {
      navigationMode = DeviceNavigationMode.none;
    }

    if (!mounted) return;

    setState(() {
      _navigationMode = navigationMode;
    });
  }

  String _getNavigationModeText(DeviceNavigationMode mode) {
    switch (mode) {
      case DeviceNavigationMode.threeButton:
        return 'Three-button navigation';
      case DeviceNavigationMode.twoButton:
        return 'Two-button navigation';
      case DeviceNavigationMode.fullScreenGesture:
        return 'Full screen gesture navigation';
      case DeviceNavigationMode.none:
        return 'Not applicable (iOS or unknown)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Mode Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Navigation Mode:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                _getNavigationModeText(_navigationMode),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: initNavigationMode,
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
