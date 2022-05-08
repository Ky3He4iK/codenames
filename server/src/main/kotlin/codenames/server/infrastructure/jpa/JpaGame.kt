package codenames.server.infrastructure.jpa

import codenames.server.domain.enums.GameStatus
import codenames.server.domain.enums.TeamColor
import codenames.server.domain.enums.TurnStatus
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaGame(
    @Id
    var gameId: ObjectId,
    var cards: List<JpaCard>? = null,
    var hints: List<JpaHint>? = null,
    var status: GameStatus,
    var turnStatus: TurnStatus,
    var curTeamColor: TeamColor,
    var nextTurnTime: Int = 0
)