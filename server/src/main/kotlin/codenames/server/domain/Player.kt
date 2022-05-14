package codenames.server.domain

import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.UserRole
import org.bson.types.ObjectId

data class Player(
    var playerId: ObjectId,
    var name: String,
    var team: GameColor? = null,
    var role: UserRole? = null
)



