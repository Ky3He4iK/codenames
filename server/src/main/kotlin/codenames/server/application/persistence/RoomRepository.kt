package codenames.server.application.persistence

import codenames.server.infrastructure.jpa.Room
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.mongodb.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface RoomRepository : JpaRepository<Room?, String?> {
    @Query("select r from Room r where r.id= :roomId")
    fun findLobbyByName(@Param("roomId") roomId: String?): Room?
}