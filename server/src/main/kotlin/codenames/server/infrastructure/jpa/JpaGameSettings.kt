package codenames.server.infrastructure.jpa

import codenames.server.domain.GameSettings
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
class JpaGameSettings(
    @Id
    var settingsId: ObjectId,
    var teamsCount: Int = 0,
    var turnTime: Int = 0,
    var cardCount: Int = 0,
    var blackCardCount: Int = 0,
    var whiteCardCount: Int = 0,
    var wordlistId: Int = 0
) {
    companion object {
        fun JpaGameSettings.toModel() = GameSettings(
            settingsId = settingsId,
            teamsCount = teamsCount,
            turnTime = turnTime,
            cardCount = cardCount,
            blackCardCount= blackCardCount,
            whiteCardCount= whiteCardCount,
            wordlistId = wordlistId
        )

        fun GameSettings.toJpa() = JpaGameSettings(
            settingsId = settingsId,
            teamsCount = teamsCount,
            turnTime = turnTime,
            cardCount = cardCount,
            blackCardCount= blackCardCount,
            whiteCardCount= whiteCardCount,
            wordlistId = wordlistId
        )
    }
}