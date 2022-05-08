package codenames.server.infrastructure.jpa

import codenames.server.domain.enums.TeamColor
import codenames.server.domain.enums.UserRole
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaPlayer(
    @Id
    var playerId: ObjectId,
    var name: String,
    var team: TeamColor? = null,
    var role: UserRole? = null
)