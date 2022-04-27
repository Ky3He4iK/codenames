package codenames.server.room.domain

import codenames.server.settings.domain.Settings
import com.fasterxml.jackson.annotation.JsonIgnore
import org.springframework.lang.NonNull
import javax.persistence.*

@Entity
class Room() {
    @NonNull
    @Id
    @GeneratedValue
    @Column
    var id: Int = 0

    @OneToOne(mappedBy = "settings", orphanRemoval = true)
    @Column
    var settings: Settings = Settings()

    var players: List<Player>? = null

    var owner: Player? = null

    var inviteCode: String? = null

    var type = 0

    var name: String? = null

    var game: Game? = null
}
