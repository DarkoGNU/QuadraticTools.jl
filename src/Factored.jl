include("Utils.jl")

struct Factored
    a
    x1
    x2
end

function toexpanded(F::Factored)
    _validitycheck

    b = -F.a * (F.x1 + F.x2)
    c = F.a * F.x1 * F.x2

    return Expanded(F.a, b, c)
end

function tovertex(F::Factored)
    return tovertex(toexpanded(F))
end

function calcvalue(F::Factored, x)
    return F.a * (x - F.x1) * (x - F.x2)
end
