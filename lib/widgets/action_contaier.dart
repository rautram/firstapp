import 'package:flutter/material.dart';

class ActionContainer extends StatelessWidget {
  final String name;
  final String address;
  const ActionContainer({Key? key, required this.name, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        Expanded(
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(name), Text(address)],
            ),
          ),
        ),
      ],
    ));
  }
}
