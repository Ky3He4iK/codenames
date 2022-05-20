package codenames.server.infrastructure.jpa

import codenames.server.domain.Hint
import codenames.server.domain.enums.GameColor
import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaHint(
    @Id
    var hintId: ObjectId,
    var word: String? = "pepega",
    var number: Int = 0,
    var team: GameColor? = GameColor.BLUE,
){
    companion object {
        fun JpaHint.toModel() = Hint(
            hintId = hintId,
            word = word,
            number = number,
            team = team
        )

        fun Hint.toJpa() = JpaHint(
            hintId = hintId,
            word = word,
            number = number,
            team = team
        )
    }
}