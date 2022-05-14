package codenames.server.domain

import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.TurnStatus
import java.util.UUID

data class Game(
    var gameId: UUID,
    var cards: List<Card>? = null,
    var hints: List<Hint>? = null,
    var status: String? = null,
    var turnStatus: TurnStatus?,
    var curTeamColor: GameColor?,
    var nextTurnTime: Int = 0
)