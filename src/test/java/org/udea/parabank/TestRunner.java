package org.udea.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate test01_Login() {
        return Karate.run("login")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test02_AddContact() {
        return Karate.run("add_contact")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

}
