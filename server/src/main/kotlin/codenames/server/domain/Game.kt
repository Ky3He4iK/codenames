package codenames.server.domain

import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.GameStatus
import codenames.server.domain.enums.TurnStatus
import org.bson.types.ObjectId

data class Game(
    var gameId: ObjectId,
    var cards: List<Card>? = null,
    var hints: List<Hint>? = null,
    var status: GameStatus,
    var turnStatus: TurnStatus?,
    var curTeamColor: GameColor?,
    var nextTurnTime: Long = 0
)