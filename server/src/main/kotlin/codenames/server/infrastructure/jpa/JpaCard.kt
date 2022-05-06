package codenames.server.infrastructure.jpa

import codenames.server.domain.Game
import codenames.server.domain.TeamColor
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document
import org.springframework.lang.NonNull

@Document
data class JpaCard(
    @Id
    var cardId: Int = 0,
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
    var chosenUsers: List<Int>? = null
)