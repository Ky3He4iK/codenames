package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import codenames.server.domain.UserRole
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