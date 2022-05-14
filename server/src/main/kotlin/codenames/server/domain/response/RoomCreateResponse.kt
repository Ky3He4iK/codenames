package codenames.server.domain.response

import codenames.server.domain.Room

class RoomCreateResponse(
    var game: Room,
) : GenericResponse()