import 'package:flutter/material.dart';

class Dialogscreen extends StatefulWidget {
  const Dialogscreen({super.key});

  @override
  State<Dialogscreen> createState() => _DialogscreenState();
}

class _DialogscreenState extends State<Dialogscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DIALOG SCREEN'),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Alert Dialog '),
                  content: Text('This is an alert dialog'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, "close"),
                      child: const Text('close'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Alert dialog')),
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Text('This isCustom Dialog'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ok'))
                    ],
                  ),
                ),
              );
            },
            child: Text(' custom dialog '))
      ]),
    );
  }
}
