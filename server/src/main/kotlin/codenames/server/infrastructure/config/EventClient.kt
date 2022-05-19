//package codenames.server.infrastructure.config
//
//import org.springframework.web.socket.TextMessage
//import org.springframework.web.socket.WebSocketSession
//import org.springframework.web.socket.client.standard.StandardWebSocketClient
//import java.io.IOException
//
//object EventClient {
//    @JvmStatic
//    fun main(args: Array<String>) {
//        // connection url
//        val uri = "ws://localhost:9000/game/123123"
//        val client = StandardWebSocketClient()
//        var session: WebSocketSession? = null
//        try {
//            // The socket that receives events
//            val socket = EventHandler()
//            // Make a handshake with server
//            val fut = client.doHandshake(socket, uri)
//            // Wait for Connect
//            session = fut.get()
//            // Send a message
//            session.sendMessage(TextMessage("Hello"))
//            // Close session
////            session.close()
//        } catch (t: Throwable) {
//            t.printStackTrace(System.err)
//        } finally {
//            try {
////                session?.close()
//            } catch (ignored: IOException) {
//            }
//        }
//    }
//}