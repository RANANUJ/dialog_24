import 'package:flutter/material.dart';

class DialogPopUp extends StatefulWidget {
  const DialogPopUp({super.key});

  @override
  State<DialogPopUp> createState() => _DialogPopUpState();
}

class _DialogPopUpState extends State<DialogPopUp> {
  var selectedColor = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          color: selectedColor ? Colors.amber : Colors.green,
          child: Column(
            children: [
              Switch(
                  value: selectedColor,
                  onChanged: (value) {
                    print("value $value");
                    selectedColor = value;
                    setState(() {});
                  })
            ],
          )),
    );
  }
}
