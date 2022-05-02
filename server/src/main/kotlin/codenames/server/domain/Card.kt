package codenames.server.domain

data class Card(
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
    var choicedUsers: List<Int>? = null
)
