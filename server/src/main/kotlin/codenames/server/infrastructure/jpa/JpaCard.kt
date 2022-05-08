package codenames.server.infrastructure.jpa

import codenames.server.domain.enums.TeamColor
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaCard(
    @Id
    var cardId: ObjectId,
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
    @DBRef
    var chosenUsers: List<JpaPlayer>? = null
)