include("Utils.jl")

struct expanded
    a
    b
    c
end

function to_factored(F::expanded)
    check(F.a)

    delta = F.b^2 - (4 * F.a * F.c)

    if (delta < 0)
        delta = Complex(delta)
    end

    x1 = (-F.b - sqrt(delta)) / 2F.a
    x2 = (-F.b + sqrt(delta)) / 2F.a

    return factored(F.a, x1, x2)
end

function to_vertex(F::expanded)
    check(F.a)

    delta = F.b^2 - (4 * F.a * F.c)

    p = -F.b / 2F.a
    q = -delta / 4F.a

    return vertex(F.a, p, q)
end
