package codenames.server.application.services

import codenames.server.application.persistence.RoomRepository
import codenames.server.domain.GameSettings
import codenames.server.domain.utils.StringUtils
import codenames.server.infrastructure.jpa.JpaGameSettings
import codenames.server.infrastructure.jpa.JpaGameSettings.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaRoom
import org.bson.types.ObjectId
import org.springframework.stereotype.Service

@Service
class RoomService(
    val roomRepository: RoomRepository,
    val playerService: PlayerService,
    val gameService: GameService,
) {
    fun createRoom(
        roomName: String,
        ownerName: String,
        isPrivate: Boolean,
        settings: GameSettings
    ) {
        val owner = playerService.createPlayer(ownerName)
        roomRepository.save(
            JpaRoom(
                roomId = ObjectId.get(),
                settings = settings.toJpa(),
                players = listOf(owner),
                owner = owner,
                inviteCode = StringUtils.getRandomString(5),
                isPrivate = isPrivate,
                name = roomName,
                game = gameService.createGame(settings)
            )
        )
    }
}