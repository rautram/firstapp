import 'package:flutter/material.dart';
import 'package:liftdedo/screens/landing/upload_documents_screen.dart';
import 'package:liftdedo/widgets/common/simple_button.dart';

class DriverRegistrationScreen extends StatefulWidget {
  const DriverRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DriverRegistrationScreen> createState() =>
      _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  void onPressed() {
    //  Navigator.push(context, route)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UploadDocumentsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Driver Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Full Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Driver License Number",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Vehicle Number",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SimpleButton(title: "Submit", onPressed: onPressed),
          ],
        ),
      ),
    ));
  }
}
