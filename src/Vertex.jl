include("Utils.jl")

"a, p, q"
struct vertex
    a
    p #x of the
    q #y of the vertex
end

"Converts the vertex function into expanded form"
function to_expanded(F::vertex)
    fcheck(F.a)

    b = -2F.a * F.p
    c = F.a * F.p^2 + F.q

    return expanded(F.a, b, c)
end

"Converts the vertex function into factored form"
function to_factored(F::vertex)
    fcheck(F.a)

    under_root = -F.q / F.a

    if (under_root < 0)
        under_root = Complex(under_root)
    end

    x1 = F.p - sqrt(under_root)
    x2 = F.p + sqrt(under_root)

    return factored(F.a, x1, x2)
end

"Returns the result of the function applied to the second parameter"
function value(F::vertex, x)
    return F.a * (x - F.p)^2 + F.q
end
