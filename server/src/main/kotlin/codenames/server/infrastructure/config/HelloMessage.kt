package codenames.server.infrastructure.config

class HelloMessage {
    var gameId: String? = null

    constructor() {}
    constructor(name: String?) {
        this.gameId = name
    }
}