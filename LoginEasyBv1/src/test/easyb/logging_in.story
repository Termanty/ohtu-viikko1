import ohtu.*
import ohtu.services.*
import ohtu.data_access.*
import ohtu.domain.*
import ohtu.io.*

description 'User can log in with valid username/password-combination'

scenario "user can login with correct password", {
    given 'command login selected', {
       userDao = new InMemoryUserDao()
       auth = new AuthenticationService(userDao)
       io = new StubIO("new", "tero", "sala1nen", "login", "tero", "sala1nen") 
       app = new App(io, auth)
    }

    when 'a valid username and password are entered', {
       app.run()
    }

    then 'user will be logged in to system', {
       io.getPrints().shouldHave("logged in")
       io.getPrints().shouldNotHave("wrong username or password")
    }
}

scenario "user can not login with incorrect password", {
    given 'command login selected', {
       userDao = new InMemoryUserDao()
       auth = new AuthenticationService(userDao)
       io = new StubIO("new", "pekka", "pekkaaa1", "login", "pekka", "maijaaa1")
       app = new App(io, auth)
    }

    when 'a valid username and incorrect password are entered', {
       app.run()
    }

    then 'user will not be logged in to system', {
       io.getPrints().shouldHave("wrong username or password")
       io.getPrints().shouldNotHave("logged in")
    }
}

scenario "nonexistent user can not login to ", {
    given 'command login selected', {
       userDao = new InMemoryUserDao()
       auth = new AuthenticationService(userDao)
       io = new StubIO("new", "pekka", "pekkaaa1", "login", "maija", "maijaaa1")
       app = new App(io, auth)
    }
    when 'a nonexistent username and some password are entered', {
       app.run()
    }
    then 'user will not be logged in to system', {
       io.getPrints().shouldHave("wrong username or password")
       io.getPrints().shouldNotHave("logged in")
    }
}