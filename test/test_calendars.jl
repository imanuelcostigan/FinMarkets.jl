# Epoch tester
@test !isweekend(Date(2014, 7, 11))
@test isweekend(Date(2014, 7, 12))
@test isweekend(Date(2014, 7, 13))
@test !isweekend(Date(2014, 7, 14))
@test FinancialMarkets.easter(2002) == Date(2002, 3, 31)
@test FinancialMarkets.easter(2014) == Date(2014, 4, 20)
@test FinancialMarkets.easter(2014, Fri) == Date(2014, 4, 18)
@test FinancialMarkets.easter(2014, Sat) == Date(2014, 4, 19)
@test FinancialMarkets.easter(2014, Sun) == Date(2014, 4, 20)
@test FinancialMarkets.easter(2014, Mon) == Date(2014, 4, 21)
@test_throws ArgumentError FinancialMarkets.easter(2014, Tue)
@test_throws ArgumentError FinancialMarkets.easter(2014, Wed)
@test_throws ArgumentError FinancialMarkets.easter(2014, Thu)
@test FinancialMarkets.easter(Date(2014, 3, 31), Sun) == FinancialMarkets.easter(2014)
@test FinancialMarkets.seasonstart(1991, Mar) - DateTime(1991, 3, 21, 3, 2, 54) <= Millisecond(51 * 1000)
@test FinancialMarkets.seasonstart(2000, Mar) - DateTime(2000, 3, 20, 7, 36, 19) <= Millisecond(51 * 1000)
@test FinancialMarkets.seasonstart(1992, Jun) - DateTime(1992, 6, 21, 3, 15, 8) <= Millisecond(39 * 1000)
@test FinancialMarkets.seasonstart(1995, Sep) - DateTime(1995, 9, 23, 12, 14, 1) <= Millisecond(44 * 1000)
@test FinancialMarkets.seasonstart(1997, Dec) - DateTime(1997, 12, 21, 20, 8, 5) <= Millisecond(41 * 1000)
@test Date(FinancialMarkets.seasonstart(1997, Dec)) == FinancialMarkets.seasonstart(Date(1997, 1, 1), Dec)
@test_throws ArgumentError FinancialMarkets.seasonstart(999, Dec)
@test_throws ArgumentError FinancialMarkets.seasonstart(3001, Dec)
@test_throws ArgumentError FinancialMarkets.seasonstart(1999, Feb)
@test FinancialMarkets.iseaster(Date(2014, 4, 20))
@test !FinancialMarkets.iseaster(Date(2014, 4, 21))
@test !FinancialMarkets.iseaster(Date(2014, 5, 20))
@test FinancialMarkets.isseasonstart(DateTime(1997, 12, 21, 20, 8, 20, 69), Dec)
@test FinancialMarkets.isseasonstart(Date(1997, 12, 21), Dec)

# Good day testers
@test !isgood(Date(2014, 7, 20))
@test isgood(Date(2014, 7, 21))
@test !isgood(Date(2015, 11, 3), +(AUSYCalendar(), AUMECalendar()))
@test isgood(Date(2015, 11, 3),
    JointCalendar([AUSYCalendar(), AUMECalendar()], false))
