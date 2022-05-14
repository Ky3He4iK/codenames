package codenames.server.domain.response

import codenames.server.domain.Player

class RoomPlayerResponse(
    var player: Player,
) : GenericResponse()