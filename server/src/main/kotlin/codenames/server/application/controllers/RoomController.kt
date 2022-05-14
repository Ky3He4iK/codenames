package codenames.server.application.controllers

import codenames.server.application.services.RoomService
import codenames.server.domain.GameSettings
import codenames.server.domain.response.GenericResponse
import codenames.server.domain.response.Message
import codenames.server.domain.response.RoomCreateResponse
import codenames.server.domain.response.RoomPlayerResponse
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/room")
class RoomController(
    val roomService: RoomService
) {
    @PostMapping("/create")
    fun createRoom(
        @RequestParam roomName: String,
        @RequestParam ownerName: String,
        @RequestParam isPrivate: Boolean,
        @RequestBody settings: GameSettings?
    ): RoomCreateResponse {
        val room = roomService.createRoom(
            roomName = roomName,
            ownerName = ownerName,
            isPrivate = isPrivate,
            settings = settings
        )
        return RoomCreateResponse(room)
    }

    @PostMapping("/join")
    fun joinRoom(
        @RequestParam inviteCode: String,
        @RequestParam joinerName: String
    ): RoomPlayerResponse {
        val joiner = roomService.joinRoom(
            inviteCode = inviteCode,
            joinerName = joinerName
        )
        return RoomPlayerResponse(joiner)
    }

    @PostMapping("/leave")
    fun leaveRoom(
        @RequestParam inviteCode: String,
        @RequestParam leaverName: String
    ): GenericResponse {
        val player = roomService.leaveRoom(
            inviteCode = inviteCode,
            leaverName = leaverName
        )
        if (player != null) {
            return RoomPlayerResponse(player)
        }
        return GenericResponse(false, Message.DELETED)
    }

}