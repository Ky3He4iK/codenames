package codenames.server.domain

data class Hint(
    var hintId: Int = 0,
    var word: String? = null,
    var number: Int = 0,
    var team: TeamColor? = null
)