package codenames.server.application.services

import codenames.server.application.persistence.PlayerRepository
import codenames.server.application.persistence.RoomRepository
import codenames.server.infrastructure.jpa.JpaPlayer
import org.bson.types.ObjectId
import org.springframework.stereotype.Service

@Service
class PlayerService(
    val playerRepository: PlayerRepository,
) {

    fun createPlayer(name: String): JpaPlayer {
        val player = JpaPlayer(playerId =  ObjectId.get(), name = name)
        playerRepository.save(player)
        return player
    }
}
