include("Utils.jl")

struct Factored
    a
    x1
    x2
end

function to_expanded(F::Factored)
    fcheck(F.a)

    b = -F.a * (F.x1 + F.x2)
    c = F.a * F.x1 * F.x2

    return Expanded(F.a, b, c)
end

function to_vertex(F::Factored)
    return to_vertex(to_expanded(F))
end

function value(F::Factored, x)
    return F.a * (x - F.x1) * (x - F.x2)
end
