package codenames.server.domain

import codenames.server.domain.enums.GameColor
import org.bson.types.ObjectId

data class Hint(
    var hintId: ObjectId,
    var word: String? = null,
    var number: Int = 0,
    var team: GameColor? = null
)