package codenames.server.application.services

import codenames.server.application.persistence.RoomRepository
import codenames.server.domain.Game
import codenames.server.domain.GameSettings
import codenames.server.domain.Room
import codenames.server.domain.utils.StringUtils
import codenames.server.infrastructure.jpa.JpaGameSettings
import codenames.server.infrastructure.jpa.JpaGameSettings.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaRoom
import codenames.server.infrastructure.jpa.JpaRoom.Companion.toModel
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
        settings: GameSettings?
    ): Room {
        val owner = playerService.createPlayer(ownerName)
        val cur_settings = settings ?: GameSettings(
            settingsId = ObjectId.get(),
            teamsCount = 2,
            turnTime = 60,
            cardCount = 25,
            blackCardCount = 1,
            whiteCardCount = 7,
            0
        )
        val jpaRoom = JpaRoom(
            roomId = ObjectId.get(),
            settings = cur_settings.toJpa(),
            players = mutableListOf(owner),
            owner = owner,
            inviteCode = StringUtils.getRandomString(5),
            isPrivate = isPrivate,
            name = roomName,
            game = gameService.createGame(cur_settings)
        )
        roomRepository.save(jpaRoom)
        return jpaRoom.toModel()
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