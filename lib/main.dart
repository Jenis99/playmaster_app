import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:playmaster_ui/playmaster_app.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return PlaymasterApp();
      }));
  // runApp(PlaymasterApp());
}
