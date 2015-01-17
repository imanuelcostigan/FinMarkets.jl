#####
# Type declarations
#####

abstract FinCalendar
abstract SingleFCalendar <: FinCalendar
immutable JointFCalendar <: FinCalendar
    calendars::Vector{SingleFCalendar}
    reducer::Function
    function JointFCalendar(c::Vector{SingleFCalendar}, r::Function = all)
        msg = "reducer must be `any` or `all`"
        r in [any, all] || throw(ArgumentError(msg))
        new(c, r)
    end
end
immutable NoFCalendar <: SingleFCalendar end


#####
# Methods
#####

join(c1::SingleFCalendar, c2::SingleFCalendar, r::Function = all) =
    JointFCalendar([c1, c2], r)
join(c1::JointFCalendar, c2::SingleFCalendar) =
    JointFCalendar([c1.calendars, c2], c1.reducer)
join(c1::SingleFCalendar, c2::JointFCalendar) =
    join(c2, c1)
join(c1::JointFCalendar, c2::JointFCalendar) =
    JointFCalendar([c1.calendars, c2.calendars], c1.reducer)
join(c::SingleFCalendar...) =
    JointFCalendar([ ci for ci in c ], all)
join(c::JointFCalendar...) =
    JointFCalendar([ jc for jc in c ], all)
Base.convert(::Type{JointFCalendar}, c::SingleFCalendar) = JointFCalendar(c)

#####
# isgood methods
#####

isweekend(dt::TimeType) = dayofweek(dt) in [Sat, Sun]
isgood(dt::TimeType, c::NoFCalendar = NoFCalendar()) = !isweekend(dt)
function isgood(dt::TimeType, c::JointFCalendar)
    rule = c.onbad ? all : any
    rule([ isgood(dt, ci) for ci in c.calendars ])
end

#####
# Other calendar methods
#####

include("calendars/epochs.jl")
include("calendars/calendars_au.jl")
include("calendars/calendars_gb.jl")
include("calendars/calendars_us.jl")
include("calendars/calendars_euta.jl")
include("calendars/calendars_jp.jl")
include("calendars/calendars_nz.jl")
