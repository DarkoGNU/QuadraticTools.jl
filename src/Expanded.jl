include("Utils.jl")

struct Expanded
    a
    b
    c
end

function tofactored(F::Expanded)
    _validitycheck

    delta = calcdelta(F.a, F.b, F.c)

    x1 = (-F.b - sqrt(delta)) / 2F.a
    x2 = (-F.b + sqrt(delta)) / 2F.a

    return Factored(F.a, x1, x2)
end

function tovertex(F::Expanded)
    _validitycheck

    delta = calcdelta(F.a, F.b, F.c)

    p = -F.b / 2F.a
    q = -delta / 4F.a

    return Vertex(F.a, p, q)
end

function calcvalue(F::Expanded, x)
    return F.a * x^2 + F.b * x + F.c
end
