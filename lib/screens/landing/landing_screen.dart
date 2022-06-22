import 'package:flutter/material.dart';
import 'package:liftdedo/screens/mobile_number_screen.dart';
import 'package:liftdedo/widgets/common/simple_button.dart';
import 'package:liftdedo/widgets/common/simple_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void onPressed(BuildContext context) {
    //  Navigator.push(context, route)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MobileNumberScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: null,
      body: Column(
        children: [
          Image.asset(
            "images/kolkata-bg.png",
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SimpleText(
                    title: "One Way Journey One Way Fare",
                    size: 20.0,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SimpleButton(
                      title: "Continue With Phone Number",
                      onPressed: () => onPressed(context)),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SimpleText(
                    title:
                        "By Continuing you agree that you have agreed our T&C and privacy policy ",
                    size: 12,
                    color: Colors.grey,
                    align: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
