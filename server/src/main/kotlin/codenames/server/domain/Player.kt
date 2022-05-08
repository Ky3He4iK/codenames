package codenames.server.domain

import codenames.server.domain.enums.TeamColor
import codenames.server.domain.enums.UserRole

data class Player(
    var playerId: Int = 0,
    var name: String? = null,
    var team: TeamColor? = null,
    var role: UserRole? = null
)



