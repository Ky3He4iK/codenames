package codenames.server.domain

import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.UserRole

data class Player(
    var playerId: Int = 0,
    var name: String? = null,
    var team: GameColor? = null,
    var role: UserRole? = null
)



