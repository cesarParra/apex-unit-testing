public with sharing class SystemUserInfo implements IUserInfo {
    public String getDefaultCurrency() {
        return UserInfo.getDefaultCurrency();
    }
}
