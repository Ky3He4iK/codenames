package codenames.server

import codenames.server.application.persistence.GameSettingsRepository
import codenames.server.infrastructure.jpa.JpaGameSettings
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.repository.findByIdOrNull


@SpringBootApplication()
class ServerApplication: CommandLineRunner {

    @Autowired
    lateinit var repository: GameSettingsRepository
    override fun run(vararg args: String?) {
        repository.deleteAll()
        repository.save(JpaGameSettings(1,1))
        repository.save(JpaGameSettings(4,42))
        var a = repository.findByWordlistId(42)
        println(a)
        repository.save(JpaGameSettings(4,56))
        a = repository.findByIdOrNull(4)
        println(a)
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


