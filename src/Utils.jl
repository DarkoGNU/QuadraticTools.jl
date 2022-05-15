function fcheck(a)
    if a == 0
        throw(DomainError(a, "'a' can't be 0"))
    end
end

function fdelta(a, b, c, allow_complex)
    delta = b^2 - (4 * a * c)

    # maybe this isn't the best way to handle functions with
    # roots that aren't real numbers, but it seems fun, right?
    if allow_complex == true && delta < 0
        delta = Complex(delta)
    end

    return delta
end
