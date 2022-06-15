import 'package:flutter/material.dart';
import 'package:liftdedo/widgets/common/SimpleButton.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final TextEditingController numberController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberController.addListener(printValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    numberController.dispose();
    super.dispose();
  }

  void printValue() {
    print('the value is ${numberController.text}');
  }

  void sendOTP() {}
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              obscureText: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your Mobile Number",
                  hintText: "Enter your Mobile Number"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SimpleButton(title: "Send OTP", onPressed: sendOTP)],
            )
          ],
        ),
      ),
    ));
  }
}
