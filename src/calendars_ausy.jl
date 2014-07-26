#####
# Type declarations
#####

immutable AUSYFCalendar <: AUFCalendar end

#####
# Methods
#####
function isbankholiday(dt::TimeType, c::AUSYFCalendar)
    dayofweek(dt) == Mon && dayofweekofmonth(dt) == 1 && month(dt) == Aug
end
function islabourdayholiday(dt::TimeType, c::AUSYFCalendar)
    dayofweek(dt) == Mon && dayofweekofmonth(dt) == 1 && month(dt) == Oct
end
function isgoodday(dt::TimeType, c::AUSYFCalendar)
    !(isweekend(dt) || isnewyearsholiday(dt, c) ||
        isaustraliadayholiday(dt, c) || isanzacdayholiday(dt, c) ||
        ischristmasdayholiday(dt, c) || isboxingdayholiday(dt, c) ||
        iseasterholiday(dt, c) || isqueensbirthdayholiday(dt, c) ||
        isqueensbirthdayholiday(dt, c) || isbankholiday(dt, c) ||
        islabourdayholiday(dt, c))
end

