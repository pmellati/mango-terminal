import 'package:flutter/material.dart';
import 'package:mango/util/local_terminal_backend.dart';
import 'package:xterm/xterm.dart';

import 'pane.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terminal App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mango", style: TextStyle(color: Colors.grey.shade900)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Pane(
            makeTerminalBackend: () => LocalTerminalBackend(),
            name: "Server",
            code: """while true; do Hello; sleep 1; done\n""",
          ))
        ],
      ),
    );
  }
}
