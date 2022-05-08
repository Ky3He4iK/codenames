package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.JpaCard
import org.bson.types.ObjectId
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface CardRepository : MongoRepository<JpaCard, ObjectId> {
}