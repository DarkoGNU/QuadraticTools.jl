module QuadraticTools

    include("Expanded.jl")
    include("Factored.jl")
    include("Vertex.jl")
    include("Utils.jl")

    export calcdelta
    export calcvalue

    export Expanded
    export Factored
    export Vertex

    export toexpanded
    export tofactored
    export tovertex

end # module
