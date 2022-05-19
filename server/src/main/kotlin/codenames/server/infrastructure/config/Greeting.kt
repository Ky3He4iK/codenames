package codenames.server.infrastructure.config

class Greeting {
    var content: String? = null
        private set

    constructor() {}
    constructor(content: String?) {
        this.content = content
    }
}