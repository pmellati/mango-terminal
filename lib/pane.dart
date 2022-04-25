import 'package:flutter/material.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/xterm.dart';

import 'local_terminal_backend.dart';

// A terminal pane with useful buttons, such as close.
class Pane extends StatefulWidget {
  const Pane({Key? key, required this.name, this.code}) : super(key: key);

  final String name;
  final String? code;

  @override
  State<StatefulWidget> createState() {
    return _PaneState();
  }
}

class _PaneState extends State<Pane> {
  final LocalTerminalBackend terminalBackend;
  late final Terminal terminal;

  _PaneState() : terminalBackend = LocalTerminalBackend() {
    terminal = Terminal(
      backend: terminalBackend,
      maxLines: 100,
    );
  }

  @override
  void initState() {
    super.initState();

    final code = widget.code;
    if (code != null) {
      terminalBackend.write(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    toolbarBtn(IconData iconData, String tooltip) => Container(
          child: IconButton(
            icon: Icon(iconData),
            color: Colors.white,
            tooltip: tooltip,
            hoverColor: Colors.transparent,
            onPressed: () {},
          ),
          margin: const EdgeInsets.only(left: 5),
        );

    toolbarBtns() => Row(
          children: [
            toolbarBtn(Icons.stop_circle_outlined, 'Terminate'),
            toolbarBtn(Icons.close, 'Close'),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        );

    title() => Text(
          widget.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        );

    toolbar() => Container(
          child: Row(
            children: [const Spacer(), title(), Expanded(child: toolbarBtns())],
          ),
          color: Colors.grey.shade800,
        );

    return Column(
      children: [
        toolbar(),
        Expanded(
            child: TerminalView(
          terminal: terminal,
        ))
      ],
    );
  }
}
