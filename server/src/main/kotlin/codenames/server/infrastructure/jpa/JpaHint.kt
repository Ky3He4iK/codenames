package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import org.springframework.lang.NonNull
//import javax.persistence.*

//@Entity
data class JpaHint(
    @NonNull
//    @Id
//    @GeneratedValue
//    @Column(name = "hint_id")
    var hintId: Int = 0,
    var word: String? = null,
    var number: Int = 0,
    var team: TeamColor? = null,
//    @ManyToOne
//    @JoinColumn(name = "game_id")
    var game: JpaGame
)