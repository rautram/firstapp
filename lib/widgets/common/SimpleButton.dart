import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const SimpleButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent[200],
      height: 45,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
