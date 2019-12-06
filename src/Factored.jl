include("Utils.jl")

"a, x1, x2"
struct factored
    a
    x1
    x2
end

"Converts the factored function into expanded form"
function to_expanded(F::factored)
    fcheck(F.a)

    b = -F.a * (F.x1 + F.x2)
    c = F.a * F.x1 * F.x2

    return expanded(F.a, b, c)
end

"Converts the factored function into vertex form"
function to_vertex(F::factored)
    return to_vertex(to_expanded(F))
end

"Returns the result of the function applied to the second parameter"
function value(F::factored, x)
    return F.a * (x - F.x1) * (x - F.x2)
end
