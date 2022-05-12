package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.JpaGameSettings
import codenames.server.infrastructure.jpa.JpaRoom
import org.bson.types.ObjectId
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface RoomRepository : MongoRepository<JpaRoom, ObjectId> {
    fun findByInviteCode(inviteCode: String): JpaRoom?
}