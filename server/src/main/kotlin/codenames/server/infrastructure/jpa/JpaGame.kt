package codenames.server.infrastructure.jpa

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document
@Document
data class JpaGame(
    @Id
    var gameId: Int = 0,
//    var cards: List<JpaCard>? = null,
//    var hints: List<JpaHint>? = null,
//    var status: String? = null,
//    var nextTurnTime: Int = 0
)