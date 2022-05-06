package codenames.server

import codenames.server.application.persistence.GameSettingsRepository
import codenames.server.application.persistence.RoomRepository
import codenames.server.infrastructure.jpa.JpaGameSettings
import codenames.server.infrastructure.jpa.JpaRoom
import org.bson.types.ObjectId
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.repository.findByIdOrNull


@SpringBootApplication
class ServerApplication: CommandLineRunner {

    @Autowired
    lateinit var repository: GameSettingsRepository

    @Autowired
    lateinit var roomRepo: RoomRepository
    override fun run(vararg args: String?) {
        repository.deleteAll()
        println(ObjectId.get())
        repository.save(JpaGameSettings(ObjectId.get(), wordlistId = 1))
//        repository.save(JpaGameSettings(ObjectId.get(),42))
        var a = repository.findByWordlistId(1)
        println(a)
        repository.save(JpaGameSettings(a!!.settingsId, wordlistId = 999))
//        a = repository.findByIdOrNull(999)
        a = repository.findByWordlistId(999)
        roomRepo.deleteAll()
        val id = ObjectId.get()
        roomRepo.save(JpaRoom(id, settingsId = a!!))
        var b = roomRepo.findByIdOrNull(id)
        println(b)

//        println("Customers found with findAll():")
//        println("-------------------------------")
//        for (settings in repository!!.findAll()) {
//            println(settings.settingsId)
//            println(settings.wordlistId)
//        }
//        println()
    }
}

fun main(args: Array<String>) {
    runApplication<ServerApplication>(*args)
}


