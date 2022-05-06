package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaHint(
    @Id
    var hintId: Int = 0,
    var word: String? = null,
    var number: Int = 0,
    var team: TeamColor? = null,
//    @ManyToOne
//    @JoinColumn(name = "game_id")
//    var game: JpaGame
)