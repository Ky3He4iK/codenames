import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class Websockets {

  late String? gameId;

  void onConnect(StompFrame frame) {
    stompClient.subscribe(
      destination: '/topic/greetings',
      callback: (frame) {
        // dynamic result = json.decode(frame.body!);
        gameId = frame.body;
        print(gameId);
        onGame(frame);
      },
    );
    stompClient.send(
      destination: '/app/hello',
      body: json.encode({'gameId': 'pepe'}),
    );
  }

  void onGame(StompFrame frame) {
    print('privet');
    stompClient.subscribe(
      destination: '/topic/games/$gameId',
      callback: (frame) {
        dynamic result = json.decode(frame.body!);
        print(result);
      },
    );
    stompClient.send(
      destination: '/app/game/$gameId',
      // body: json.encode({'gameId': 'pepe'}),
      body: gameId
    );
  }

  late StompClient stompClient = StompClient(
    config: StompConfig(
      url: 'ws://localhost:9000/ws',
      onConnect: onConnect,
      beforeConnect: () async {
        print('waiting to connect...');
        await Future.delayed(Duration(milliseconds: 200));
        print('connecting...');
      },
      onWebSocketError: (dynamic error) => print(error.toString()),
      stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
      webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
    ),
  );
}



void main() {
  var ws = Websockets();
  ws.stompClient.activate();
}

// Timer.periodic(Duration(seconds: 10), (_) {
//       stompClient.send(
//         destination: '/app/hello',
//         body: json.encode({'gameId': 'pepe'}),
//         // body: '627fea1ed6c00034014e246c'
//       );
//     });