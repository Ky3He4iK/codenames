package codenames.server.application.services

import codenames.server.application.persistence.CardRepository
import codenames.server.infrastructure.jpa.JpaCard
import org.springframework.stereotype.Service

@Service
class CardService(
    val cardRepository: CardRepository
) {
    fun generateCardPack(
        size: Int
    ): List<JpaCard> {
        return emptyList()
    }
}
