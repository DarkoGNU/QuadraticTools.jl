using QuadraticTools
using Test

@testset "QuadraticTools.jl" begin
    # test the validity checker
    @test_throws DomainError QuadraticTools._validitycheck(0)
    @test_nowarn QuadraticTools._validitycheck(0.1)
    @test_nowarn QuadraticTools._validitycheck(0 + 5im)

    # test the delta calculation
    @test calcdelta(1, 1, -1) == 5
    @test calcdelta(1, 1, 1) == -3
    @test calcdelta(2, -7, -5) == 89

    # test conversions from the expanded form
    @test tofactored(Expanded(1, 5, 6)) == Factored(1, -3.0, -2.0)
    @test tovertex(Expanded(1, 5, 6)) == Vertex(1, -2.5, -0.25)
    @test calcvalue(Expanded(1, 5, 6), 10) == 156

    # test conversions from the factored form
    @test toexpanded(Factored(1, -3.0, -2.0)) == Expanded(1, 5.0, 6.0)
    @test tovertex(Factored(1, -3.0, -2.0)) == Vertex(1, -2.5, -0.25)
    @test calcvalue(Factored(1, -3.0, -2.0), 10) == 156.0
    @test tofactored(Vertex(-1, -2.5, -0.25)) == Factored(-1, -2.5 - 0.5im, -2.5 + 0.5im)

    # test conversions from the vertex form
    @test toexpanded(Vertex(1, -2.5, -0.25)) == Expanded(1, 5.0, 6.0)
    @test tofactored(Vertex(1, -2.5, -0.25)) == Factored(1, -3.0, -2.0)
    @test calcvalue(Vertex(1, -2.5, -0.25), 10) == 156.0    
end
