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
                players = mutableListOf(owner),
                owner = owner,
                inviteCode = StringUtils.getRandomString(5),
                isPrivate = isPrivate,
                name = roomName,
                game = gameService.createGame(settings)
            )
        )
    }

    fun joinRoom(
        inviteCode: String,
        joinerName: String
    ) {
        val joiner = playerService.createPlayer(joinerName)
        val room = roomRepository.findByInviteCode(inviteCode)
        if (room != null) {
            roomRepository.save(room.apply {
                players.add(joiner)
            })
        }
    }

    fun leaveRoom(
        inviteCode: String,
        leaverName: String
    ) {
        val room = roomRepository.findByInviteCode(inviteCode)
        if (room != null) {
            val newpPlayers = room.players
            val leaver = newpPlayers.find {
                it.name == leaverName
            }
            newpPlayers.remove(leaver)
            roomRepository.save(room.apply {
                players = newpPlayers
            })
        }
    }
}