package codenames.server.infrastructure.jpa

import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaGame(
    @Id
    var gameId: ObjectId,
    var cards: List<JpaCard>? = null,
    var hints: List<JpaHint>? = null,
    var status: String? = null,
    var nextTurnTime: Int = 0
)