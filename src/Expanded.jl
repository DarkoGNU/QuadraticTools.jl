include("Utils.jl")

struct Expanded
    a
    b
    c
end

function to_factored(F::Expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, true)

    x1 = (-F.b - sqrt(delta)) / 2F.a
    x2 = (-F.b + sqrt(delta)) / 2F.a

    return Factored(F.a, x1, x2)
end

function to_vertex(F::Expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, false)

    p = -F.b / 2F.a
    q = -delta / 4F.a

    return Vertex(F.a, p, q)
end

function value(F::Expanded, x)
    return F.a * x^2 + F.b * x + F.c
end
