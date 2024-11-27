import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightController extends ChangeNotifier {
  bool _isFlashlightOn = false;

  bool get isFlashlightOn => _isFlashlightOn;

  Future<void> toggleFlashlight() async {
    try {
      if (_isFlashlightOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      _isFlashlightOn = !_isFlashlightOn;
      notifyListeners();
    } catch (e) {
      // Handle devices without flashlight or errors
      print('Error toggling flashlight: $e');
    }
  }
}
