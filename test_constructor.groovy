class SomeOtherClass {
    private final Object pipe
    private final Map someMap

    private SomeOtherClass(Object pipeline, Map someMap) {
        pipe = pipeline
        someMap = someMap
    }

    @groovy.transform.CompileStatic
    public int someMethod(final String hej) {
        return hej
    }

}
