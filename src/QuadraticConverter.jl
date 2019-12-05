module QuadraticConverter
include("Expanded.jl")
include("Factored.jl")
include("Vertex.jl")

export expanded
export factored
export vertex

export to_expanded
export to_factored
export to_vertex

end # module
