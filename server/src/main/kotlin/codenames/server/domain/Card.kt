package codenames.server.domain

import codenames.server.domain.enums.TeamColor

data class Card(
    var cardId: Int = 0,
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
    var choicedUsers: List<Int>? = null
)
