include("Utils.jl")

struct vertex
    a
    p
    q
end

function to_expanded(F::vertex)
    check(F.a)

    b = -2F.a * F.p
    c = F.a * F.p^2 + F.q

    return expanded(F.a, b, c)
end

function to_factored(F::factored)
    check(F.a)

    under_root = -F.q / F.a

    if (under_root < 0)
        under_root = Complex(under_root)
    end

    x1 = F.p - sqrt(under_root)
    x2 = F.p - sqrt(under_root)

    return factored(F.a, x1, x2)
end
