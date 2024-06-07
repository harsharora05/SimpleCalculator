import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final _FirstController = TextEditingController();
  final _SecondController = TextEditingController();

  num result = 0;
  var border = const OutlineInputBorder(
    borderSide:
        BorderSide(style: BorderStyle.solid, color: Colors.black, width: 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            textfieldDisplay(controller: _FirstController, border: border),
            const SizedBox(
              height: 20,
            ),
            textfieldDisplay(
              controller: _SecondController,
              border: border,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              result.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      result = num.parse(_FirstController.text) +
                          num.parse(_SecondController.text);
                    });
                  },
                  child: const Icon(CupertinoIcons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    num a = num.parse(_FirstController.text);
                    num b = num.parse(_SecondController.text);
                    if (a > b) {
                      setState(() {
                        result = a - b;
                      });
                    } else {
                      setState(() {
                        result = b - a;
                      });
                    }
                  },
                  child: const Icon(CupertinoIcons.minus),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      result = num.parse(_FirstController.text) *
                          num.parse(_SecondController.text);
                    });
                  },
                  child: const Icon(CupertinoIcons.multiply),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      result = num.parse(_FirstController.text) /
                          num.parse(_SecondController.text);
                    });
                  },
                  child: const Icon(CupertinoIcons.divide),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            FloatingActionButton(
              onPressed: () {
                _FirstController.clear();
                _SecondController.clear();
                setState(() {
                  result = 0;
                  _FirstController.clear();
                  _SecondController.clear();
                });
              },
              child: const Text("Clear"),
            )
          ],
        ),
      ),
    );
  }
}

class textfieldDisplay extends StatelessWidget {
  const textfieldDisplay({
    super.key,
    required this.border,
    required this.controller,
  });

  final OutlineInputBorder border;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: "Enter a Number",
        border: border,
        focusedBorder: border,
      ),
    );
  }
}
