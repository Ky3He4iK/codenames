package codenames.server.domain

import org.bson.types.ObjectId

class GameSettings(
    var settingsId: ObjectId,
    var teamsCount: Int = 0,
    var turnTime: Int = 0,
    var cardCount: Int = 42,
    var blackCardCount: Int = 0,
    var whiteCardCount: Int = 0,
    var wordlistId: Int = 0
)

//https://github.com/CaIlbackCats/codenames