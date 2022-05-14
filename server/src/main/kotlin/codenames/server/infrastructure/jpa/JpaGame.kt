package codenames.server.infrastructure.jpa

import codenames.server.domain.Game
import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.GameStatus
import codenames.server.domain.enums.TurnStatus
import codenames.server.infrastructure.jpa.JpaCard.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaCard.Companion.toModel
import codenames.server.infrastructure.jpa.JpaHint.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaHint.Companion.toModel
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
    var turnStatus: TurnStatus?,
    var curTeamColor: GameColor?,
    var nextTurnTime: Int = 0
) {
    companion object {
        fun JpaGame.toModel() = Game(
            gameId = gameId,
            cards = cards?.let { it.map{ unit -> unit.toModel() } },
            hints = hints?.let { it.map{ unit -> unit.toModel() } },
            status = status,
            turnStatus= turnStatus,
            curTeamColor= curTeamColor,
            nextTurnTime = nextTurnTime
        )

        fun Game.toJpa() = JpaGame(
            gameId = gameId,
            cards = cards?.let { it.map{ unit -> unit.toJpa() } },
            hints = hints?.let { it.map{ unit -> unit.toJpa() } },
            status = status,
            turnStatus= turnStatus,
            curTeamColor= curTeamColor,
            nextTurnTime = nextTurnTime
        )
    }
}