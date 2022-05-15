function _validitycheck(a)
    if a == 0
        throw(DomainError(a, "'a' is zero - the quadratic function is degenerated"))
    end
end

function calcdelta(a, b, c)
    delta = b^2 - (4 * a * c)
    return delta
end
