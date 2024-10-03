import 'package:flutter/material.dart';
import 'package:network_connectivity/Video_Call/calling_page.dart';

class HomePageCalling extends StatelessWidget {
  final callIDTextCtrl = TextEditingController(text: "testCallID");

  HomePageCalling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration:
                      const InputDecoration(labelText: "start a call by id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallingPage(
                        callId: callIDTextCtrl.text,
                      );
                    }),
                  );
                },
                child: const Text("call"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
