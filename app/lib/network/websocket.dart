import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket {
  late final WebSocketChannel _channel;
  late final StreamSubscription subscription;

  void sendMessage(String text) {
    _channel.sink.add(text);
  }

  void dispose() {
    subscription.cancel();
    _channel.sink.close();
  }

  WebSocket(void Function(String) onMessage, // message => void
      {void Function(String)? onError, // error => void
      void Function()? onDone, // void => void
      String url = 'ws://localhost:8080'}) {
    _channel = WebSocketChannel.connect(
      Uri.parse(url),
    );
    subscription = _channel.stream.listen(onMessage as void Function(dynamic),
        onError: onError, onDone: onDone);
  }
}
