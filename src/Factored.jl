include("Utils.jl")

struct factored
    a
    x1
    x2
end

function to_expanded(F::factored)
    fcheck(F.a)

    b = -F.a * (F.x1 + F.x2)
    c = F.a * F.x1 * F.x2

    return expanded(F.a, b, c)
end

function to_vertex(F::factored)
    return to_vertex(to_expanded(F))
end

function value(F::factored, x)
    return F.a * (x - F.x1) * (x - F.x2)
end
