import 'package:flutter/material.dart';
import 'package:liftdedo/widgets/common/simple_text.dart';

class PickerItem extends StatelessWidget {
  final String name;
  const PickerItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: SimpleText(title: name),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
              child: const Icon(
                Icons.upload_file_outlined,
                color: Colors.grey,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
