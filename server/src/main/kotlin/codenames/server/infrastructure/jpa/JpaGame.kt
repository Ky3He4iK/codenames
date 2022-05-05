package codenames.server.infrastructure.jpa

import org.springframework.data.mongodb.core.mapping.Document

@Document
data class JpaGame(
//    @NonNull
//    @Id
//    @GeneratedValue
//    @Column(name = "game_id")
    var gameId: Int = 0,
//    @Column(name = "cards")
//    @OneToMany(mappedBy = "game")
    var cards: List<JpaCard>? = null,
//    @Column(name = "hints")
//    @OneToMany(mappedBy = "game")
    var hints: List<JpaHint>? = null,
    var status: String? = null,
    var nextTurnTime: Int = 0
)