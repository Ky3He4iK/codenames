package codenames.server.domain

data class Room(
    var roomId: Int = 0,
    var settings: GameSettings? = null,
    var players: List<Player>? = null,
    var owner: Player? = null,
    var inviteCode: String? = null,
    var isPrivate: Boolean = true,
    var name: String? = null,
    var game: Game? = null
)