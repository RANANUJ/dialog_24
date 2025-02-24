import 'package:flutter/material.dart';
import 'package:dialog_24/dialog_pop_up.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var isEnabled = true;
  var test = "Text From Pop Up Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 255, 210),
        title: const Text("Dialog Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        child: StatefulBuilder(builder: (context, alertState) {
                          return AlertDialog(
                            title: Text("Alert Dialog"),
                            content: Container(
                              color: isEnabled == true
                                  ? Colors.red[900]
                                  : Colors.green[700],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("This is a Alert Dialog"),
                                  Switch(
                                      value: isEnabled,
                                      onChanged: (value) {
                                        isEnabled = value;
                                        alertState(() {});
                                      })
                                ],
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Back"),
                                ),
                              ),
                            ],
                          );
                        }),
                      );
                    },
                  );
                },
                child: const Text("Alert Dailog"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: StatefulBuilder(builder: (context, customState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                color: isEnabled == true
                                    ? Colors.yellowAccent
                                    : Colors.orange,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("This is a Custom Dialog"),
                                    Switch(
                                        value: isEnabled,
                                        onChanged: (value) {
                                          isEnabled = value;
                                          customState(() {});
                                        }),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Back"),
                                ),
                              ),
                            ],
                          );
                        }),
                      );
                    },
                  );
                },
                child: const Text("Custom Dialog"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => PopUpDialogScreen()).then((value) {
                    test = value;
                    setState(() {});
                  });
                },
                child: Text("Pop up to Dailog box"),
              ),
            ),
            Text(test),
          ],
        ),
      ),
    );
  }
}
