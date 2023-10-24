import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/provider/fiveth_ex_provider.dart';

class FivethExample extends StatefulWidget {
  const FivethExample({super.key});

  @override
  State<FivethExample> createState() => _FivethExampleState();
}

class _FivethExampleState extends State<FivethExample> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<FivethExampleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Five_Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailAddressController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "E-Mail",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                authprovider.login(
                  emailAddressController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authprovider.loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Login",
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
