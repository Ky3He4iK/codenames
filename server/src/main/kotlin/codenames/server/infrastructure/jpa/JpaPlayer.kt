package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import codenames.server.domain.UserRole
import org.springframework.lang.NonNull
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
data class JpaPlayer(
    @NonNull
    @Id
    @GeneratedValue
    @Column
    var id: Int,
    var name: String,
    var team: TeamColor? = null,
    var role: UserRole? = null
)