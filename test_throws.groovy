class SomeClass {
    private String someString

    public SomeClass(String someS) {
       someString = someS
    }

    public String someOtherMethod(String projectName) throws Exception {
        print projectName
    }
}

someInstance = new SomeClass("someString")
SomeInstance.someOtherMethod("hi")
