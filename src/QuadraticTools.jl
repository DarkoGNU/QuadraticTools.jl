module QuadraticTools

    include("Expanded.jl")
    include("Factored.jl")
    include("Vertex.jl")
    include("Utils.jl")

    export Expanded
    export Factored
    export Vertex

    export to_expanded
    export to_factored
    export to_vertex

    export value
    export fdelta

end # module
