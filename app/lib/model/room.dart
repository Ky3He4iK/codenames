import 'package:app/model/participant.dart';

import 'settings.dart';

class Room{
  Settings _settings;
  int _playerCount;
  Participant _host;
  String _code;
  bool _type;
  String _name;

  Room(this._settings, this._playerCount, this._host, this._code, this._type,
      this._name);
}