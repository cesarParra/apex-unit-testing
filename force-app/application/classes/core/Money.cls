public with sharing class Money {
    private String currencyIsoCode;
    private Decimal amount;
    private static String defaultCurrencyIsoCode {
        get {
            if (defaultCurrencyIsoCode == null) {
                defaultCurrencyIsoCode = UserInfoFactory.get().getDefaultCurrency();
            }
            return defaultCurrencyIsoCode;
        }
        private set;
    }

    private Money(Decimal amount) {
        this(amount, defaultCurrencyIsoCode);
    }

    private Money(Decimal amount, String currencyIsoCode) {
        this.amount = amount;
        this.currencyIsoCode = currencyIsoCode;
    }

    public static Money of(Decimal amount) {
        return new Money(amount);
    }

    public static Money of(Decimal amount, String currencyIsoCode) {
        return new Money(amount, currencyIsoCode);
    }

    public static Money zero() {
        return Money.of(0);
    }

    public static Money zero(String currencyIsoCode) {
        return Money.of(0, currencyIsoCode);
    }

    public String getCurrency() {
        return this.currencyIsoCode != null ? this.currencyIsoCode : defaultCurrencyIsoCode;
    }

    public Decimal getValue() {
        return this.amount;
    }

    public Money add(Money moneyToAdd) {
        checkCurrenciesMatch(moneyToAdd);
        return Money.of(this.amount + moneyToAdd.getValue(), this.getCurrency());
    }

    public static Money sum(List<Money> moneyList) {
        if (moneyList.isEmpty()) {
            return Money.zero();
        }

        Money sum = Money.zero(moneyList[0].getCurrency());
        for (Money currentMoney : moneyList) {
            sum = sum.add(currentMoney);
        }
        return sum;
    }

    public Boolean equals(Object compareTo) {
        if (!(compareTo instanceof Money)) {
            return false;
        }

        Money compareToCast = (Money)compareTo;
        return this.getValue() == compareToCast.getValue() && this.getCurrency() == compareToCast.getCurrency();
    }

    private void checkCurrenciesMatch(Money compareTo) {
        if (this.getCurrency() != compareTo.getCurrency()) {
            throw new MismatchedCurrencyException(buildErrorMessage(compareTo));
        }
    }

    private String buildErrorMessage(Money compareTo) {
        return String.format('{0} does not match the expected currency: {1}', new List<String>{
            compareTo.getCurrency(), this.getCurrency()
        });
    }

    public class MismatchedCurrencyException extends Exception { }
}
