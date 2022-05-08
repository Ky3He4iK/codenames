package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.JpaHint
import org.bson.types.ObjectId
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface HintRepository : MongoRepository<JpaHint, ObjectId> {
}