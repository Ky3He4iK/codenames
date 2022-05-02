package codenames.server.infrastructure.jpa

import codenames.server.domain.TeamColor
import org.springframework.lang.NonNull
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
data class JpaCard(
    @NonNull
    @Id
    @GeneratedValue
    @Column
    var id: Int = 0
)