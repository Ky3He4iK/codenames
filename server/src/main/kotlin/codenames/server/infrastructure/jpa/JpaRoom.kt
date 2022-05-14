package codenames.server.infrastructure.jpa

import codenames.server.domain.GameSettings
import codenames.server.domain.Room
import codenames.server.infrastructure.jpa.JpaGame.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaGame.Companion.toModel
import codenames.server.infrastructure.jpa.JpaGameSettings.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaGameSettings.Companion.toModel
import codenames.server.infrastructure.jpa.JpaPlayer.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaPlayer.Companion.toModel
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import org.springframework.data.mongodb.core.mapping.Document


@Document
class JpaRoom(
    @Id
    var roomId: ObjectId,

    var settings: JpaGameSettings,

    @DBRef
    var players: MutableList<JpaPlayer> = mutableListOf(),

    @DBRef
    var owner: JpaPlayer,

    var inviteCode: String? = null,

    var isPrivate: Boolean,

    var name: String? = null,

    @DBRef
    var game: JpaGame? = null
) {
    companion object {
        fun JpaRoom.toModel() = Room(
            roomId = roomId,
            settings = settings.toModel(),
            players = players.map { it.toModel() }.toMutableList(),
            owner = owner.toModel(),
            inviteCode= inviteCode,
            isPrivate= isPrivate,
            name = name,
            game = game?.toModel()
        )

        fun Room.toJpa() = JpaRoom(
            roomId = roomId,
            settings = settings.toJpa(),
            players = players.map { it.toJpa() }.toMutableList(),
            owner = owner.toJpa(),
            inviteCode= inviteCode,
            isPrivate= isPrivate,
            name = name,
            game = game?.toJpa()
        )
    }
}
