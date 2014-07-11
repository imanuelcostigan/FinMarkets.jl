d1 = Date(2014, 1, 1)
d2 = Date(2015, 1, 1)
d3 = Date(2014, 2, 1)
d4 = Date(2012, 12, 1)

# A/365
a365 = A365()
@test_approx_eq years(d1, d2, a365) 1.0
@test_approx_eq years(d2, d1, a365)  -1.0
@test_approx_eq years(d1, d3, a365)  31 / 365

# A/360
a360 = A360()
@test_approx_eq years(d1, d2, a360)  365 / 360
@test_approx_eq years(d2, d1, a360)  -365 / 360
@test_approx_eq years(d1, d3, a360)  31 / 360

# Act/Act
actact = ActAct()
@test_approx_eq years(d1, d2, actact)  1.0
@test_approx_eq years(d2, d1, actact)  -1.0
@test_approx_eq years(d4, d1, actact)  31 / 366 + 1