package codenames.server.application.controllers

import codenames.server.domain.Game
import org.springframework.messaging.handler.annotation.DestinationVariable
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RestController

@RestController("/game")
class GameController {

    @MessageMapping("{id}")
    fun sendMessage(@DestinationVariable id: String, game: Game){

    }

}