package codenames.server.domain

data class Game(
    var gameId: Int = 0,
    var cards: List<Card>? = null,
    var hints: List<Hint>? = null,
    var status: String? = null,
    var nextTurnTime: Int = 0
)