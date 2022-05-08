package codenames.server

import codenames.server.application.persistence.*
import codenames.server.domain.enums.TeamColor
import codenames.server.domain.enums.UserRole
import codenames.server.infrastructure.jpa.JpaCard
import codenames.server.infrastructure.jpa.JpaPlayer
import org.bson.types.ObjectId
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.repository.findByIdOrNull


@SpringBootApplication
class ServerApplication: CommandLineRunner {

    @Autowired
    lateinit var gameRepo: GameRepository
    @Autowired
    lateinit var playerRepo: PlayerRepository
    @Autowired
    lateinit var settingsRepo: GameSettingsRepository
    @Autowired
    lateinit var hintRepo: HintRepository
    @Autowired
    lateinit var cardRepo: CardRepository
    @Autowired
    lateinit var roomRepo: RoomRepository


    override fun run(vararg args: String?) {
        playerRepo.deleteAll()
        val a = ObjectId.get()
        val b = ObjectId.get()
        playerRepo.save(JpaPlayer(a, "kekus", team = TeamColor.RED, role = UserRole.PLAYER))
        playerRepo.save(JpaPlayer(b, "admin", team = TeamColor.BLUE, role = UserRole.CAPTAIN))

        cardRepo.deleteAll()
        val c = ObjectId.get()
        val d = ObjectId.get()
        cardRepo.save(
            JpaCard(c, color = TeamColor.BLACK,
            chosenUsers = listOf(playerRepo.findByIdOrNull(a)!!, playerRepo.findByIdOrNull(b)!!))
        )
        cardRepo.save(
            JpaCard(d, color = TeamColor.YELLOW,
            chosenUsers = listOf(playerRepo.findByIdOrNull(b)!!))
        )

//        gameRepo.deleteAll()
//        gameRepo.save(JpaGame(ObjectId.get(), listOf()))


    }
}

fun main(args: Array<String>) {
    runApplication<ServerApplication>(*args)
}


