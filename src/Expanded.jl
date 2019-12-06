include("Utils.jl")

struct expanded
    a
    b
    c
end

function to_factored(F::expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, true)

    x1 = (-F.b - sqrt(delta)) / 2F.a
    x2 = (-F.b + sqrt(delta)) / 2F.a

    return factored(F.a, x1, x2)
end

function to_vertex(F::expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, false)

    p = -F.b / 2F.a
    q = -delta / 4F.a

    return vertex(F.a, p, q)
end

function value(F::expanded, x)
    return F.a * x^2 + F.b * x + F.c
end