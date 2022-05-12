package codenames.server.infrastructure.jpa

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
    var owner: JpaPlayer? = null,

    var inviteCode: String? = null,

    var isPrivate: Boolean,

    var name: String? = null,

    @DBRef
    var game: JpaGame? = null
) {

}
