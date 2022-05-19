package codenames.server.application.controllers

import codenames.server.application.services.GameService
import codenames.server.infrastructure.config.Greeting
import codenames.server.infrastructure.config.HelloMessage
import org.springframework.messaging.handler.annotation.DestinationVariable
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.util.HtmlUtils


@RestController
//@RequestMapping("/game")
class GameController(
    val gameService: GameService
) {
//    @MessageMapping("/{gameId}")
//    fun sendMessage(@DestinationVariable gameId: String){
//        println("handling game socket message for game: $gameId")
//        val isExists = gameService.getGame(gameId)
//        if (isExists) {
//            println("game exists")
//        }
//        return
//    }

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    @Throws(Exception::class)
    fun greeting(message: HelloMessage): Greeting? {
        Thread.sleep(1000) // simulated delay
        println("Я САСУ ХУЙ!!!!!!!!!!!!!!")
        return Greeting("Hello, " + HtmlUtils.htmlEscape(message.name ?: "") + "!")
    }

}