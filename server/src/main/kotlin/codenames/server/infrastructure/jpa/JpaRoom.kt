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

    @DBRef
    var settingsId: JpaGameSettings
) {
//    @OneToOne(mappedBy = "settings", orphanRemoval = true)
//    @Column
//    var settings: Settings = Settings()
//
//    var players: List<Player>? = null
//
//    var owner: Player? = null
//
//    var inviteCode: String? = null
//
//    var type = 0
//
//    var name: String? = null
//
//    var game: Game? = null
}
