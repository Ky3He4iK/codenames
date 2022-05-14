package codenames.server.domain.response

open class GenericResponse(
    val success: Boolean = true,
    val message: String = "")

object Message {
    const val INTERNAL = "Внутренняя ошибка"
    const val USERNAME_SHORT = "Имя пользователя слишком короткое"
    const val USER_EXISTS = "Пользователь с таким именем уже существует"
    const val NOT_FOUND = "Объект не найден"
    const val DELETED = "Объект успешно удален"
    const val ADDED = "Объект успешно добавлен"
    const val UPDATED = "Объект успешно обновлен"
}