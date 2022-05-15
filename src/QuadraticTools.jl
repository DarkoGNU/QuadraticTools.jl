module QuadraticTools

    include("Expanded.jl")
    include("Factored.jl")
    include("Vertex.jl")
    include("Utils.jl")

    export expanded
    export factored
    export vertex

    export to_expanded
    export to_factored
    export to_vertex

    export value
    export fdelta

end # module
