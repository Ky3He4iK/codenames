package codenames.server.domain

data class Player(
    var id: Int = 0,
    var name: String? = null,
    var team: TeamColor? = null,
    var role: UserRole? = null
)


