package codenames.server.domain

class GameSettings(
    var settingsId: Int = 0,
    var teamsCount: Int = 0,
    var turnTime: Int = 0,
    var cardCount: Int = 0,
    var blackCardCount: Int = 0,
    var whiteCardCount: Int = 0,
    var wordlistId: Int = 0
)

//https://github.com/CaIlbackCats/codenames