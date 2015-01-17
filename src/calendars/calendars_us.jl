#####
# Type declarations
#####

abstract USCalendar <: SingleCalendar
immutable USNYCalendar <: USCalendar end
immutable USLIBORCalendar <: USCalendar end

#####
# Methods
#####

function isnewyearsholiday(dt::TimeType, c::USCalendar)
    (dayofyear(dt) == 1 ||
        (day(dt) == 31 && month(dt) == Dec && dayofweek(dt) == Fri) ||
        (day(dt) == 2 && month(dt) == Jan && dayofweek(dt) == Mon))
end
function ismlkdayholiday(dt::TimeType, c::USCalendar)
    dayofweekofmonth(dt) == 3 && dayofweek(dt) == Mon && month(dt) == Jan
end
function iswashingtonsbdayholiday(dt::TimeType, c::USCalendar)
    dayofweekofmonth(dt) == 3 && dayofweek(dt) == Mon && month(dt) == Feb
end
function ismemorialdayholiday(dt::TimeType, c::USCalendar)
    day(dt) > 24 && dayofweek(dt) == Mon && month(dt) == May
end
function isindependencedayholiday(dt::TimeType, c::USCalendar)
    ((day(dt) == 4 ||
        (day(dt) == 3 && dayofweek(dt) == Fri) ||
        (day(dt) == 5 && dayofweek(dt) == Mon)) && month(dt) == Jul)
end
function isindependencedayholiday(dt::TimeType, c::USLIBORCalendar)
    day(dt) == 4 && month(dt) == Jul
end

function islabourdayholiday(dt::TimeType, c::USCalendar)
    dayofweekofmonth(dt) == 1 && dayofweek(dt) == Mon && month(dt) == Sep
end
function iscolumbusdayholiday(dt::TimeType, c::USCalendar)
    dayofweekofmonth(dt) == 2 && dayofweek(dt) == Mon && month(dt) == Oct
end
function isveteransdayholiday(dt::TimeType, c::USCalendar)
    ((day(dt) == 11 ||
        (day(dt) == 10 && dayofweek(dt) == Fri) ||
        (day(dt) == 12 && dayofweek(dt) == Mon)) && month(dt) == Nov)
end
function isthanksgivingdayholiday(dt::TimeType, c::USCalendar)
    dayofweekofmonth(dt) == 4 && dayofweek(dt) == Thu && month(dt) == Nov
end
function ischristmasdayholiday(dt::TimeType, c::USCalendar)
    ((day(dt) == 25 || (day(dt) == 24 && dayofweek(dt) == Fri) ||
        (day(dt) == 26 && dayofweek(dt) == Mon)) && month(dt) == Dec)
end
function isgood(dt::TimeType, c::USCalendar)
    # http://en.wikipedia.org/wiki/New_York_State_government_holidays
    !(isweekend(dt) || isnewyearsholiday(dt, c) ||
        ismlkdayholiday(dt, c) || iswashingtonsbdayholiday(dt, c) ||
        ismemorialdayholiday(dt, c) || isindependencedayholiday(dt, c) ||
        islabourdayholiday(dt, c) || iscolumbusdayholiday(dt, c) ||
        isveteransdayholiday(dt, c) || isthanksgivingdayholiday(dt, c) ||
        ischristmasdayholiday(dt, c))
end
function isgood(dt::TimeType, c::USLIBORCalendar)
    # Used for O/N USD LIBOR
    # https://www.theice.com/iba/libor
    !(ismlkdayholiday(dt, c) || iswashingtonsbdayholiday(dt, c) ||
        isindependencedayholiday(dt, c) || islabourdayholiday(dt, c) ||
        iscolumbusdayholiday(dt, c) || isveteransdayholiday(dt, c) ||
        isthanksgivingdayholiday(dt, c))
end

