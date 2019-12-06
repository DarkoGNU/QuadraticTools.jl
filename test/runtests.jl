using QuadraticConverter
using Test

@testset "QuadraticConverter.jl" begin
    #check.. the checkl
    @test_throws DomainError fcheck(0)

    #check the delta function
    @test fdelta(1, 1, -1, false) == 5
    @test fdelta(1, 1, 1, true) == -3 + 0im
    @test fdelta(1, 1, 1, false) == -3

    #check the functions of expanded
    @test to_factored(expanded(1, 5, 6)) == factored(1, -3.0, -2.0)
    @test to_vertex(expanded(1, 5, 6)) == vertex(1, -2.5, -0.25)
    @test value(expanded(1, 5, 6), 10) == 156

    #check the functions of factored
    @test to_expanded(factored(1, -3.0, -2.0)) == expanded(1, 5.0, 6.0)
    @test to_vertex(factored(1, -3.0, -2.0)) == vertex(1, -2.5, -0.25)
    @test value(factored(1, -3.0, -2.0), 10) == 156.0

    #check the functions of vertex
    @test to_expanded(vertex(1, -2.5, -0.25)) == expanded(1, 5.0, 6.0)
    @test to_factored(vertex(1, -2.5, -0.25)) == factored(1, -3.0, -2.0)
    @test value(vertex(1, -2.5, -0.25), 10) == 156.0

    #just to make the coverage 100%
    @test to_factored(vertex(-1, -2.5, -0.25)) == factored(-1, -2.5 - 0.5im, -2.5 + 0.5im)
end
