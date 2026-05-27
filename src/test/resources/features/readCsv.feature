Feature: Read CSV File

  Scenario: Read Created CSV File

    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')

    * def path = Paths.get('target/posts.csv')

    * def csvFile = new java.lang.String(Files.readAllBytes(path))

    * print csvFile