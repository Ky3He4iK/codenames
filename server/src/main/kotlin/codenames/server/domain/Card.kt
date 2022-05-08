package codenames.server.domain

import codenames.server.domain.enums.GameColor

data class Card(
    var cardId: Int = 0,
    var text: String? = null,
    var cardColor: GameColor? = null,
    var state: String? = null,
    var choicedUsers: List<Int>? = null
)
