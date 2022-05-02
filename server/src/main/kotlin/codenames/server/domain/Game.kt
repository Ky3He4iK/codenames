package codenames.server.domain

import javax.smartcardio.Card


data class Game(
    var cards: List<Card>? = null,
    var hints: List<Hint>? = null,
    var status: String? = null,
    var nextTurnTime: Int = 0
)