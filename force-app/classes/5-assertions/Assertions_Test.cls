@IsTest
private class Assertions_Test {
    // WHAT
    // * Use meaningful assertion helpers, rather than a generic "assert" method.

    // DON'T
    @IsTest
    static void dont() {
        String aValue;
        System.assert(aValue != null); // Result: "Assertion Failed"
    }

    // DO
    @IsTest
    static void goodAssertions() {
        // Good
        String aValue;
        System.assertNotEquals(null, aValue); // Result: "Assertion Failed: Same value: null"

        // Better
        Assert.areEqual(null, aValue); // Result: "Assertion Failed: Same value: null"

        // Best
        Assert.isNull(aValue);

        // Other helpers
        // Assert.areNotEqual(null, aValue);
        // Assert.areEqual();
        // Assert.isFalse();
        // Assert.isTrue();
        // Assert.fail();
        // Assert.isInstanceOfType();
        // Assert.isNotInstanceOfType();
        // Assert.isNotNull();
        // Assert.isNull();
    }

    // WHY
    // * Better clarity to other devs about what is being asserted
    // * Better error messages from Salesforce when something fails
}
