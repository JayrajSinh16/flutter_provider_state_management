import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/second_ex_provider.dart';
import 'package:state/screens/second_ex_second_screen.dart';

class SecondExample extends StatefulWidget {
  const SecondExample({super.key});

  @override
  State<SecondExample> createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second_Example"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondExampleSecondScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.featured_video_sharp,
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: Consumer<SecondExampleProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selected.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text(
                          "Item number: $index",
                        ),
                        trailing: Icon( value.selected.contains(index) ? Icons.favorite: Icons.favorite_border_outlined),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
