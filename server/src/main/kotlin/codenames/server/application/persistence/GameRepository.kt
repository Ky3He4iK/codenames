package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.JpaGame
import codenames.server.infrastructure.jpa.JpaRoom
import org.bson.types.ObjectId
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface GameRepository : MongoRepository<JpaGame, ObjectId> {
}