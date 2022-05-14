package codenames.server.domain

import org.bson.types.ObjectId

data class Room(
    var roomId: ObjectId ,
    var settings: GameSettings,
    var players: MutableList<Player>,
    var owner: Player,
    var inviteCode: String? = null,
    var isPrivate: Boolean = true,
    var name: String? = null,
    var game: Game? = null
)