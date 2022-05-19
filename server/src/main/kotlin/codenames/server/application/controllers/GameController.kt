package codenames.server.application.controllers

import codenames.server.application.services.GameService
import codenames.server.domain.Game
import codenames.server.domain.GameSettings
import codenames.server.infrastructure.config.HelloMessage
import org.bson.types.ObjectId
import org.springframework.messaging.handler.annotation.DestinationVariable
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.web.bind.annotation.RestController


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
    fun greeting(helloMessage: HelloMessage): String? {
        Thread.sleep(1000) // simulated delay
        println("Я САСУ ХУЙ!!!!!!!!!!!!!!")
        val game = gameService.createGame(GameSettings(ObjectId.get()))
        return game.gameId.toString()
    }

    @MessageMapping("/game/{gameId}")
    @SendTo("/topic/games/{gameId}")
    @Throws(Exception::class)
    fun checkGame(@DestinationVariable gameId: String): Game? {
        Thread.sleep(1000) // simulated delay
        println("Я КРУЧУ ХУЙ!!!!!!!!!!!!!!")
        val isExists = gameService.checkGameExistence(gameId)
        if (isExists) {
            println("game exists")
        }
        return gameService.getGame(gameId)
    }

//    @MessageMapping("/hello")
//    @SendTo("/topic/greetings")
//    @Throws(Exception::class)
//    fun greeting(message: HelloMessage): Greeting? {
//        Thread.sleep(1000) // simulated delay
//        println("Я САСУ ХУЙ!!!!!!!!!!!!!!")
//        return Greeting("Hello, " + HtmlUtils.htmlEscape(message.name ?: "") + "!")
//    }



}