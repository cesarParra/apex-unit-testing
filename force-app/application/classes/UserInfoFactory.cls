public with sharing class UserInfoFactory {
    private static IUserInfo mockUserInfo;

    public static IUserInfo get() {
        if (mockUserInfo != null) {
            return mockUserInfo;
        }
        return new SystemUserInfo();
    }

    @TestVisible
    private static void setMock(IUserInfo userInfoMock) {
        mockUserInfo = userInfoMock;
    }
}
