import groovy.json.JsonSlurper

// import static groovy.json.JsonOutput.prettyPrint
// import static groovy.json.JsonOutput.toJson
import groovy.json.JsonOutput
JsonOutput.toJson()


def foo() {
  println("foo")
  return {b -> b()}
}
def bar() {
  println("bar")
  return {println("hello")}
}
foo() bar()
