package codenames.server.application.services

import codenames.server.application.persistence.HintRepository
import codenames.server.domain.enums.GameColor
import codenames.server.infrastructure.jpa.JpaHint
import org.bson.types.ObjectId
import org.springframework.stereotype.Service

@Service
class HintService(
    val hintRepository: HintRepository
) {
    fun generateHintPack(): List<JpaHint> {
        val lst = mutableListOf<JpaHint>()
        lst.add(JpaHint(ObjectId.get(), "Миска", 2, GameColor.BLUE))
        lst.add(JpaHint(ObjectId.get(), "Рис", 3, GameColor.BLUE))
        lst.add(JpaHint(ObjectId.get(), "Кошкожена", 1, GameColor.BLUE))
        lst.add(JpaHint(ObjectId.get(), "Вкусная", 5, GameColor.RED))
        lst.add(JpaHint(ObjectId.get(), "Резать", 5, GameColor.RED))
        lst.add(JpaHint(ObjectId.get(), "Колбаса", 5, GameColor.RED))
        lst.add(JpaHint(ObjectId.get(), "Хлопья", 4, GameColor.YELLOW))
        lst.add(JpaHint(ObjectId.get(), "Ранний", 2, GameColor.YELLOW))
        lst.add(JpaHint(ObjectId.get(), "Котеночек", 0, GameColor.YELLOW))
        lst.add(JpaHint(ObjectId.get(), "Студенты", 0, GameColor.GREEN))
        lst.add(JpaHint(ObjectId.get(), "Ожидание", 6, GameColor.GREEN))
        lst.add(JpaHint(ObjectId.get(), "Шаблон", 9, GameColor.GREEN))
        return lst
    }

}