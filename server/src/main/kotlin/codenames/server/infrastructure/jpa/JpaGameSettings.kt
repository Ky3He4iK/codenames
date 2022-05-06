package codenames.server.infrastructure.jpa

import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
class JpaGameSettings(
    @Id
    var settingsId: ObjectId,
    var teamsCount: Int = 0,
    var turnTime: Int = 0,
    var cardCount: Int = 0,
    var blackCardCount: Int = 0,
    var whiteCardCount: Int = 0,
    var wordlistId: Int = 0
)