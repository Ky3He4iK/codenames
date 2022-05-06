package codenames.server.infrastructure.jpa

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
class JpaGameSettings(
    @Id
    var settingsId: Int = 0,
    var wordlistId: Int = 0
)