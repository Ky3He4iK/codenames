package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import codenames.server.domain.UserRole

//@Entity
data class JpaPlayer(
//    @NonNull
//    @Id
//    @GeneratedValue
//    @Column
    var id: Int,
    var name: String,
    var team: TeamColor? = null,
    var role: UserRole? = null
)