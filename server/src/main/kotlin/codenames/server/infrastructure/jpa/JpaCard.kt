package codenames.server.infrastructure.jpa

import codenames.server.domain.Card
import codenames.server.domain.Hint
import codenames.server.domain.enums.GameColor
import codenames.server.infrastructure.jpa.JpaPlayer.Companion.toJpa
import codenames.server.infrastructure.jpa.JpaPlayer.Companion.toModel
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaCard(
    @Id
    var cardId: ObjectId,
    var text: String? = "Спасибо, Михаил!",
    var cardColor: GameColor? = GameColor.BLUE,
    var state: Boolean? = false,
    @DBRef
    var chosenUsers: List<JpaPlayer>? = listOf()
) {
    companion object {
        fun JpaCard.toModel() = Card(
            cardId = cardId,
            text = text,
            cardColor = cardColor,
            state = state,
            chosenUsers = chosenUsers?.let { it.map { unit -> unit.toModel() } }
        )

        fun Card.toJpa() = JpaCard(
            cardId = cardId,
            text = text,
            cardColor = cardColor,
            state = state,
            chosenUsers = chosenUsers?.let { it.map { unit -> unit.toJpa() } }
        )
    }
}