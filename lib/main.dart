import 'package:flutter/material.dart';
import 'package:mango/pane.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terminal App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numPanes = 1;

  void _onButtonPressed() {
    setState(() {
      numPanes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mango", style: TextStyle(color: Colors.grey.shade900)),
      ),
      body: Column(
        children: const [Expanded(child: Pane(name: "Server"))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonPressed,
        child: const Icon(Icons.run_circle),
      ),
    );
  }
}