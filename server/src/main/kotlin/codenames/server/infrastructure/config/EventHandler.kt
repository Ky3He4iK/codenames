package codenames.server.infrastructure.config

import org.springframework.stereotype.Component
import org.springframework.web.socket.CloseStatus
import org.springframework.web.socket.TextMessage
import org.springframework.web.socket.WebSocketHandler
import org.springframework.web.socket.WebSocketSession
import org.springframework.web.socket.handler.TextWebSocketHandler

//@Component
//class EventHandler : TextWebSocketHandler(), WebSocketHandler {
//    @Throws(Exception::class)
//    override fun afterConnectionEstablished(session: WebSocketSession) {
//        super.afterConnectionEstablished(session)
//        println("Socket Connected: $session")
//    }
//
//    @Throws(Exception::class)
//    override fun handleTextMessage(session: WebSocketSession, message: TextMessage) {
//        session.sendMessage(TextMessage("{ \"history\": [ \"ololo\", \"2\" ] }"))
//        println("Received $message")
//    }
//
//    @Throws(Exception::class)
//    override fun afterConnectionClosed(session: WebSocketSession, closeStatus: CloseStatus) {
//        println("Socket Closed: [" + closeStatus.code + "] " + closeStatus.reason)
//        super.afterConnectionClosed(session, closeStatus)
//    }
//}