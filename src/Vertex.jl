include("Utils.jl")

struct Vertex
    a
    p # x of the Vertex
    q # y of the Vertex
end

function to_expanded(F: Vertex)
    fcheck(F.a)

    b = -2F.a * F.p
    c = F.a * F.p^2 + F.q

    return Expanded(F.a, b, c)
end

function to_factored(F: Vertex)
    fcheck(F.a)

    under_root = -F.q / F.a

    if (under_root < 0)
        under_root = Complex(under_root)
    end

    x1 = F.p - sqrt(under_root)
    x2 = F.p + sqrt(under_root)

    return Factored(F.a, x1, x2)
end

function value(F: Vertex, x)
    return F.a * (x - F.p)^2 + F.q
end
