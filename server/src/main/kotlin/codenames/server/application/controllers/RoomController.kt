package codenames.server.application.controllers

import codenames.server.application.services.RoomService
import codenames.server.domain.GameSettings
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class RoomController(
    val roomService: RoomService
) {
    @PostMapping
    fun createRoom(
        @RequestParam roomName: String,
        @RequestParam ownerName: String,
        @RequestParam isPrivate: Boolean,
        @RequestBody settings: GameSettings?
    ) {
        roomService.createRoom(
            roomName = roomName,
            ownerName = ownerName,
            isPrivate = isPrivate,
            settings = settings
        )
    }

    @PostMapping
    fun joinRoom(
        @RequestParam inviteCode: String,
        @RequestParam joinerName: String
    ) {
        roomService.joinRoom(
            inviteCode = inviteCode,
            joinerName = joinerName
        )
    }

    @PostMapping
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