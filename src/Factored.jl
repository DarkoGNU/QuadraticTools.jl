include("Utils.jl")

struct factored
    a
    x1
    x2
end

function to_expanded(F::factored)
    check(F.a)

    b = -F.a * (F.x1 + F.x2)
    c = F.a * F.x1 * F.x2

    return expanded(F.a, b, c)
end

function to_vertex(F::factored)
    return to_vertex(to_expanded(F))
end
