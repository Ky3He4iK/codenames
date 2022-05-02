package codenames.server.infrastructure.jpa

import org.springframework.lang.NonNull
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class JpaGame {
    @NonNull
    @Id
    @GeneratedValue
    @Column
    var id: Int = 0
}