import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/second_ex_provider.dart';

class SecondExampleSecondScreen extends StatefulWidget {
  const SecondExampleSecondScreen({super.key});

  @override
  State<SecondExampleSecondScreen> createState() => _SecondExampleSecondScreenState();
}

class _SecondExampleSecondScreenState extends State<SecondExampleSecondScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SecondExampleProvider>(context);

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
              itemCount: provider.selected.length,
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
                         trailing: const Icon(Icons.favorite)
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