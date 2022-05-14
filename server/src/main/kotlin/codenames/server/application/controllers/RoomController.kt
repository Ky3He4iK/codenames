package codenames.server.application.controllers

import codenames.server.application.services.RoomService
import codenames.server.domain.GameSettings
import codenames.server.domain.Room
import codenames.server.domain.response.RoomCreateResponse
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
    ) {
        roomService.joinRoom(
            inviteCode = inviteCode,
            joinerName = joinerName
        )
    }

    @PostMapping("/leave")
    fun leaveRoom(
        @RequestParam inviteCode: String,
        @RequestParam leaverName: String
    ) {
        roomService.leaveRoom(
            inviteCode = inviteCode,
            leaverName = leaverName
        )
    }

}