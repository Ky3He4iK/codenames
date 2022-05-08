package codenames.server.infrastructure.jpa

import codenames.server.domain.enums.TeamColor
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaHint(
    @Id
    var hintId: ObjectId,
    var word: String? = null,
    var number: Int = 0,
    var team: TeamColor? = null,
)