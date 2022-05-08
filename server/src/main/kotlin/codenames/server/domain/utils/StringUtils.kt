package codenames.server.domain.utils

object StringUtils {
    private val chars = ('A'..'Z') + ('a'..'z') + ('0'..'9')
    fun getRandomString(length: Int): String =
        (1..length).map { chars.random() }.joinToString("")
}