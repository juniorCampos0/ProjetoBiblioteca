import com.library.Author
import com.library.UserLogRole
import com.library.UserLog
import com.library.Role
import com.library.Book

class BootStrap {

    def init = { servletContext ->


        if (Book.list().size() < 3){
            def autor1 = new Author(fullName: "José de Alencar").save(failOnError: true)
            def book1 = new Book(title: "Iracema", isbn: "123456787", available: true, authors: autor1).save(failOnError: true)

            def autor2 = new Author(fullName: "Geoge R. R, Martin").save(failOnError: true)
            def book2 = new Book(title: "As Crônicas do gelo e fogo",  available: true, subtitle: "A guerra dos tronos", isbn: "123456788", authors: autor2).save(failOnError: true)

            def autor3 = new Author(fullName: "Patrick Ruthfuss").save(failOnError: true)
            def book3 = new Book(title: "As Crônicas do Matador de reis",  available: true, subtitle: "O nome do vento", isbn: "123456789", authors: autor3).save(failOnError: true)
        }

        if (UserLog.list().size() == 0){
            def me = new UserLog(username: 'root@super.com', password: 'password', nome:"Admin", telefone: "84999666666", endereco: "Rua Serra do Carmo, 60").save(failOnError: true)
            def role= new Role('ROLE_ADMIN').save(failOnError: true)
            def role2 = new Role('ROLE_USER').save(failOnError: true)
            def userRole = new UserLogRole(me,role).save(failOnError: true)
            userRole = new UserLogRole(me, role2).save(failOnError: true)
        }

        UserLogRole.withSession {
            it.flush()
            it.clear()
        }
    }

    def destroy = {
    }
}
