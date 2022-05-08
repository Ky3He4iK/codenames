package codenames.server.domain

import codenames.server.domain.enums.GameColor

data class Hint(
    var hintId: Int = 0,
    var word: String? = null,
    var number: Int = 0,
    var team: GameColor? = null
)