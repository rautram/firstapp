import 'package:flutter/material.dart';

class MyRidesScreen extends StatefulWidget {
  const MyRidesScreen({Key? key}) : super(key: key);

  @override
  State<MyRidesScreen> createState() => _MyRidesScreenState();
}

class _MyRidesScreenState extends State<MyRidesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Icon(
                Icons.menu,
                color: Colors.black,
                size: 30.0,
              ),
            ],
          )),
      body: Container(
        
      ),
    );
  }
}
