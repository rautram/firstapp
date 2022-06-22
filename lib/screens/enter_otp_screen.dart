import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liftdedo/screens/landing/driver_registration_screen.dart';
import 'package:liftdedo/screens/main/myrides_screen.dart';
import 'package:liftdedo/widgets/common/simple_button.dart';

class EnterOTPScreen extends StatefulWidget {
  final String verificationCode;
  final FirebaseAuth? auth;
  const EnterOTPScreen({Key? key, required this.verificationCode, this.auth})
      : super(key: key);

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  String otp = "";
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpController.addListener(printOtp);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  void printOtp() {
    setState(() {
      otp = otpController.text;
    });
  }

  void onPressed() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationCode, smsCode: otp);
    await widget.auth?.signInWithCredential(credential);
    if (!mounted) return;
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const MyRidesScreen()),
    //     (Route<dynamic> route) => false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DriverRegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: otpController,
            ),
            const SizedBox(
              height: 20,
            ),
            SimpleButton(title: "Verify OTP", onPressed: onPressed)
          ],
        ),
      ),
    ));
  }
}

// pk.eyJ1IjoicnVkcmF4cHJvbG9naWNuZXBhbCIsImEiOiJja3BubGpqbDI0ZnFmMm5ueHBxb3k5eWdzIn0.qBJOA3W5tUambYny2Gc34A
