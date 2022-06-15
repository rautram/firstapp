import 'package:flutter/material.dart';
import 'package:liftdedo/screens/mobile_number_screen.dart';
import 'package:liftdedo/widgets/common/SimpleButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleButton(
              title: "Customer Registration",
              onPressed: onPressed,
            ),
            const SizedBox(height: 20),
            SimpleButton(
              title: "Driver Registration",
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
