include("Utils.jl")

"a, b, c"
struct expanded
    a
    b
    c
end

"Converts the expanded function into factored form"
function to_factored(F::expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, true)

    x1 = (-F.b - sqrt(delta)) / 2F.a
    x2 = (-F.b + sqrt(delta)) / 2F.a

    return factored(F.a, x1, x2)
end

"Converts the expanded function into vertex form"
function to_vertex(F::expanded)
    fcheck(F.a)

    delta = fdelta(F.a, F.b, F.c, false)

    p = -F.b / 2F.a
    q = -delta / 4F.a

    return vertex(F.a, p, q)
end

"Returns the result of the function applied to the second parameter"
function value(F::expanded, x)
    return F.a * x^2 + F.b * x + F.c
end
