import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liftdedo/screens/enter_otp_screen.dart';
import 'package:liftdedo/screens/landing/driver_registration_screen.dart';
import 'package:liftdedo/widgets/common/simple_button.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final FirebaseAuth? auth = FirebaseAuth.instance;
  String number = "";
  bool isLoading = false;
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
    setState(() {
      number = numberController.text;
    });
  }

  void verifyNumber() {
    if (number.length < 9) {
      const snackBar = SnackBar(
        content: Text('Please enter a valid number'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        isLoading = true;
      });
      sendOTP();
    }
  }

  void sendOTP() async {
    await auth?.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth?.signInWithCredential(credential);
          if (!mounted) return;
          setState(() {
            isLoading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DriverRegistrationScreen()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            isLoading = false;
          });
          if (e.code == 'invalid-phone-number') {
            const snackBar = SnackBar(
              content: Text('Please enter a valid number'),
              backgroundColor: Colors.redAccent,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

          // Handle other errors
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            isLoading = false;
          });
          // Update the UI - wait for the user to enter the SMS code
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EnterOTPScreen(
                        verificationCode: verificationId,
                        auth: auth,
                      )));
        },
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              obscureText: false,
              controller: numberController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your Mobile Number",
                  hintText: "Enter your Mobile Number"),
            ),
            const SizedBox(
              height: 20,
            ),
            SimpleButton(
              title: "Send OTP",
              onPressed: verifyNumber,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    ));
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      isLoading = false;
    });
  }
}
