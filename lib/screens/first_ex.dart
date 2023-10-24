import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/first_ex_provider.dart';

class FirstExample extends StatefulWidget {
  const FirstExample({super.key});

  @override
  State<FirstExample> createState() => _FirstExampleState();
}

class _FirstExampleState extends State<FirstExample> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State_Management"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<FirstExampleProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.opacity,
                min: 0,
                max: 1,
                onChanged: (val) {
                  print(val);
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<FirstExampleProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(value.opacity),
                      ),
                      child: const Center(
                        child: Text("Yaad aa rahi hai"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(value.opacity),
                      ),
                      child: const Center(
                        child: Text("Tumhari"),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
