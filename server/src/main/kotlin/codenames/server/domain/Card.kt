package codenames.server.domain

data class Card(
    var id: Int = 0,
    var text: String? = null,
    var color: TeamColor? = null,
    var state: String? = null,
    var choicedUsers: List<Int>? = null
)
