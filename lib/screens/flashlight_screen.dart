import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/flashlight_controller.dart';
import '../utils/permissions.dart';

class FlashlightScreen extends StatelessWidget {
  const FlashlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FlashlightController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight App'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: Permissions.requestCameraPermission(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError || snapshot.data == false) {
              return const Text(
                'Camera permission denied or unavailable.',
                style: TextStyle(color: Colors.red),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  controller.isFlashlightOn ? Icons.flash_on : Icons.flash_off,
                  color:
                      controller.isFlashlightOn ? Colors.yellow : Colors.grey,
                  size: 100,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.toggleFlashlight,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Icon(
                    controller.isFlashlightOn
                        ? Icons.flash_off
                        : Icons.flash_on,
                    size: 30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
