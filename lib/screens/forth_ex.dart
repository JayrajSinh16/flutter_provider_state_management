import 'package:flutter/material.dart';

class ForthExample extends StatelessWidget {
  ForthExample({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forth_Example"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return Container(
                color: Colors.deepPurple,
                margin: const EdgeInsets.all(50),
                child: TextField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(
                        !toggle.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Column(
                children: [
                  const Text(
                    "I Am  Iron Man",
                  ),
                  Text(
                    "${_counter.value}",
                  ),
                ],
              );
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
