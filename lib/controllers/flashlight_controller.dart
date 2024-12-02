import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightController with ChangeNotifier {
  bool _isFlashlightOn = false;

  bool get isFlashlightOn => _isFlashlightOn;

  FlashlightController() {
    _isFlashlightOn = false; // Initialize state.
  }

  void toggleFlashlight() async {
    try {
      if (_isFlashlightOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      _isFlashlightOn = !_isFlashlightOn;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to toggle flashlight: $e');
    }
  }
}
