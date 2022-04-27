package codenames.server.settings.domain

import org.springframework.lang.NonNull
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Settings {
    @NonNull
    @Id
    @GeneratedValue
    @Column
    var id: Int = 0
}

//https://github.com/CaIlbackCats/codenames