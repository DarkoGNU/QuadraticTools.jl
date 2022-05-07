# QuadraticConverter

[![Build Status](https://travis-ci.com/DarkoGNU/QuadraticConverter.jl.svg?branch=master)](https://travis-ci.com/DarkoGNU/QuadraticConverter.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/DarkoGNU/QuadraticConverter.jl?svg=true)](https://ci.appveyor.com/project/DarkoGNU/QuadraticConverter-jl)
[![Codecov](https://codecov.io/gh/DarkoGNU/QuadraticConverter.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/DarkoGNU/QuadraticConverter.jl)

This package can convert between the three main forms of quadratic functions

## Are complex / imaginary numbers handled?

Yes, they're handled. The function `fdelta` has a parameter `allow_complex`, which, when set to `false`, will prevent it from returning a complex number.
Right now, however, that parameter can't be customized when using other functions - they'll just assume that complex numbers are allowed.

## Usage

- create a struct representing the expanded form: `expanded(a, b, c)`, e.g. `expanded(1, 5, 6)`
- create a struct representing the factored form: `factored(a, x1, x2)`, e.g. `factored(1, -3.0, -2.0)`
- create a struct representing the vertex form: `vertex(a, p, q)`, e.g. `vertex(1, -2.5, -0.25)`

- convert a function to the expanded form: `to_expanded(other_form)`, e.g. `to_expanded(vertex(1, -2.5, -0.25))`
- convert a function to the factored form: `to_factored(other_form)`, e.g. `to_factored(expanded(1, 5, 6))`
- convert a function to the vertex form: `to_vertex(other_form)`, e.g. `to_vertex(factored(1, -3.0, -2.0))`

- calculate the value of a function in a certain point: `value(some_form, x)`, e.g. `value(expanded(1, 5, 6), 10)`

- compare two functions in the same form: just use `==`, e.g. `to_factored(vertex(-1, -2.5, -0.25)) == factored(-1, -2.5 - 0.5im, -2.5 + 0.5im)`
