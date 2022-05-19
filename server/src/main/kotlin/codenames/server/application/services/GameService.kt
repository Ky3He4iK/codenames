package codenames.server.application.services

import codenames.server.application.persistence.GameRepository
import codenames.server.domain.GameSettings
import codenames.server.domain.enums.GameStatus
import codenames.server.infrastructure.jpa.JpaGame
import org.bson.types.ObjectId
import org.springframework.stereotype.Service

@Service
class GameService(
    val gameRepository: GameRepository,
    val cardService: CardService,
) {
    fun createGame(
        settings: GameSettings
    ): JpaGame {
        val game = JpaGame(
            gameId = ObjectId.get(),
            cards = cardService.generateCardPack(settings.cardCount),
            hints = listOf(),
            status = GameStatus.PREPARING,
            turnStatus = null,
            curTeamColor = null,
            nextTurnTime = 0
        )
        gameRepository.save(game)
        return game
    }

    fun getGame(
        gameId: String
    ): Boolean {
        return try {
            gameRepository.findById(ObjectId(gameId))
            true
        } catch (e: IllegalArgumentException) {
            false
        }
    }
}
