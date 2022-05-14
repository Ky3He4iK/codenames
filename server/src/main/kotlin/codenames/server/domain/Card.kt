package codenames.server.domain

import codenames.server.domain.enums.GameColor
import org.bson.types.ObjectId

data class Card(
    var cardId: ObjectId,
    var text: String? = null,
    var cardColor: GameColor? = null,
    var state: String? = null,
    var chosenUsers: List<Player>? = null
)
