package codenames.server.infrastructure.jpa

import codenames.server.domain.Game
import codenames.server.domain.TeamColor
import org.springframework.data.mongodb.core.mapping.Document
import org.springframework.lang.NonNull

@Document
data class JpaCard(
//    @NonNull
//    @Id
//    @GeneratedValue
//    @Column(name = "card_id")
    var cardId: Int = 0,
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
//    @ElementCollection
//    @Column(name = "choiced_users")
    var choicedUsers: List<Int>? = null,
//    @ManyToOne
//    @JoinColumn(name = "game_id")
    var game: JpaGame
)