import 'dart:io';
import 'package:pty/pty.dart';
import 'package:xterm/xterm.dart';

class LocalTerminalBackend extends TerminalBackend {
  LocalTerminalBackend();

  // TODO: Is this being created on object creation?
  final pty = PseudoTerminal.start(
    '/bin/zsh',
    [],
    environment: Platform.environment,
  );

  @override
  Future<int> get exitCode => pty.exitCode;

  @override
  void init() {}

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
    // client.disconnect('terminate');
  }

  @override
  void ackProcessed() {
    // NOOP
  }
}
