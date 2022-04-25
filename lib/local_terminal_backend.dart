import 'dart:io';
import 'package:pty/pty.dart';
import 'package:xterm/xterm.dart';

class LocalTerminalBackend extends TerminalBackend {
  LocalTerminalBackend();

  final pty = PseudoTerminal.start(
    Platform.environment['SHELL'] ?? 'sh',
    ['-l'],
    environment: {'TERM': 'xterm-256color'},
  );

  @override
  Future<int> get exitCode => pty.exitCode;

  @override
  void init() {
    pty.init();
  }

  @override
  Stream<String> get out => pty.out;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    pty.resize(width, height);
  }

  @override
  void write(String input) {
    pty.write(input);
  }

  @override
  void terminate() {
    pty.kill();
  }

  @override
  void ackProcessed() {
    pty.ackProcessed();
  }
}
