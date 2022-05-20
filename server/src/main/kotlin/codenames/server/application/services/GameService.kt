package codenames.server.application.services

import codenames.server.application.persistence.GameRepository
import codenames.server.domain.Game
import codenames.server.domain.GameSettings
import codenames.server.domain.enums.GameColor
import codenames.server.domain.enums.GameStatus
import codenames.server.domain.enums.TurnStatus
import codenames.server.infrastructure.jpa.JpaGame
import codenames.server.infrastructure.jpa.JpaGame.Companion.toModel
import codenames.server.infrastructure.jpa.JpaHint
import org.bson.types.ObjectId
import org.springframework.stereotype.Service
import java.time.LocalDateTime

@Service
class GameService(
    val gameRepository: GameRepository,
    val cardService: CardService,
    val hintService: HintService,
) {
    fun createGame(
        settings: GameSettings
    ): JpaGame {
        val game = JpaGame(
            gameId = ObjectId.get(),
            cards = cardService.generateCardPack(settings.cardCount),
            hints = hintService.generateHintPack(),
            status = GameStatus.PLAYING,
            turnStatus = TurnStatus.GUESSING,
            curTeamColor = GameColor.BLUE,
            nextTurnTime = (System.currentTimeMillis() + 60000)
        )
        gameRepository.save(game)
        return game
    }

    fun checkGameExistence(
        gameId: String
    ): Boolean {
        return try {
            gameRepository.findById(ObjectId(gameId))
            true
        } catch (e: IllegalArgumentException) {
            false
        }
    }

    fun getGame(
        gameId: String
    ): Game? {
        return try {
            gameRepository.findById(ObjectId(gameId)).get().toModel()
        } catch (e: IllegalArgumentException) {
            null
        }
    }
}
