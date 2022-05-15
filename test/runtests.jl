using QuadraticTools
using Test

@testset "QuadraticTools.jl" begin
    # check the 'a' parameter checker
    @test_throws DomainError QuadraticTools.fcheck(0)

    # check the delta function
    @test fdelta(1, 1, -1, false) == 5
    @test fdelta(1, 1, 1, true) == -3 + 0im
    @test fdelta(1, 1, 1, false) == -3

    # check the functions of expanded
    @test to_factored(Expanded(1, 5, 6)) == Factored(1, -3.0, -2.0)
    @test to_vertex(Expanded(1, 5, 6)) == Vertex(1, -2.5, -0.25)
    @test value(Expanded(1, 5, 6), 10) == 156

    # check the functions of factored
    @test to_expanded(Factored(1, -3.0, -2.0)) == Expanded(1, 5.0, 6.0)
    @test to_vertex(Factored(1, -3.0, -2.0)) == Vertex(1, -2.5, -0.25)
    @test value(Factored(1, -3.0, -2.0), 10) == 156.0

    # check the functions of vertex
    @test to_expanded(Vertex(1, -2.5, -0.25)) == Expanded(1, 5.0, 6.0)
    @test to_factored(Vertex(1, -2.5, -0.25)) == Factored(1, -3.0, -2.0)
    @test value(Vertex(1, -2.5, -0.25), 10) == 156.0

    # just to make the coverage 100%
    @test to_factored(Vertex(-1, -2.5, -0.25)) == Factored(-1, -2.5 - 0.5im, -2.5 + 0.5im)
end
