// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const Center(
        child: Text('Content for Screen 1'),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        leading: isListView
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if (!isListView) {
                    setState(() {
                      isListView = true;
                    });
                  }
                },
              ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isListView
              ? Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 30,
                        width: Get.width,
                        color: Colors.amberAccent,
                        child: Center(child: Text(items[index])),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Center(
                          child: Text("hey"),
                        ),
                      );
                    },
                  ),
                ),
          if (isListView)
            Align(
              alignment: Alignment.topCenter,
              child: TextButton(
                onPressed: () {
                  // Toggle between ListView and GridView
                  setState(() {
                    isListView = !isListView;
                  });
                },
                child: Text('View All'),
              ),
            ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: const Center(
        child: Text('Content for Screen 3'),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Center(
        child: Text('Content for New Screen'),
      ),
    );
  }
}
