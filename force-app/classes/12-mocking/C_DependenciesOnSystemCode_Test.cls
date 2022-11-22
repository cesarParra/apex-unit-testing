@IsTest
private class C_DependenciesOnSystemCode_Test {
    // WHAT
    // * When depending on Salesforce code (System classes) it can be difficult/impossible to test for all
    //   possible scenarios. Depend on an interface you control rather than depending directly on Salesforce code.

    @IsTest
    static void do_dependOnYourInterfaceInsteadOfSalesforceCode() {
        IUserInfo fakeUserInfo = new FakeUserInfo('DOP');
        UserInfoFactory.setMock(fakeUserInfo);

        Money dominicanMoney = Money.of(100);

        Assert.areEqual('DOP', dominicanMoney.getCurrency());
    }

    private class FakeUserInfo implements IUserInfo {
        private String currencyCode = 'USD';

        public FakeUserInfo(String currencyCode) {
            this.currencyCode = currencyCode;
        }

        public String getDefaultCurrency() {
            return currencyCode;
        }
    }
}
