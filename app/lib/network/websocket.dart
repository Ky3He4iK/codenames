import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocket {
  late final IOWebSocketChannel _channel;

  void sendMessage(String text) {
    _channel.sink.add(text);
  }

  void dispose() {
    _channel.sink.close();
  }

  WebSocket(void Function(dynamic) onMessage, // message => void
      {Function? onError, // message => void
      void Function()? onDone, // void => void
      String url = 'wss://echo.websocket.events'}) {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(url),
    );
    _channel.stream.listen(onMessage, onError: onError, onDone: onDone);
  }
}
