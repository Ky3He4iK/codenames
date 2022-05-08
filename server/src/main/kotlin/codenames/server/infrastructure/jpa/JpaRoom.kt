package codenames.server.infrastructure.jpa

import codenames.server.domain.GameSettings
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import org.springframework.data.mongodb.core.mapping.Document


@Document
class JpaRoom(
    @Id
    var roomId: ObjectId,

    var settingsId: JpaGameSettings,

    @DBRef
    var players: List<JpaPlayer>? = null,

    @DBRef
    var owner: JpaPlayer? = null,

    var inviteCode: String? = null,

    var type: Int = 0,

    var name: String? = null,

    @DBRef
    var game: JpaGame? = null
) {

}
