package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.JpaGameSettings
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface GameSettingsRepository: MongoRepository<JpaGameSettings, Int> {
    fun findByWordlistId(wordListId: Int): JpaGameSettings?
}