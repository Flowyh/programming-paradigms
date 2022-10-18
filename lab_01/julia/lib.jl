module Lib

  export PairInt64
  export _factorial, _factorial_r
  export _gcd, _gcd_r
  export diophantine_equation, diophantine_equation_r
  
  struct PairInt64
    x::Int64
    y::Int64
    possible::Bool
  end

  function _factorial(x::UInt64)::UInt64
    if (x > 20)
      return UInt64(0)
    end

    res::UInt64 = 1

    for i::UInt64 = 2:x
      res *= i
    end

    return res
  end

  function _factorial_r(x::UInt64)::UInt64
    if (x > 20)
      return UInt64(0)
    end

    if (x <= 1)
      return UInt64(1)
    end

    return x * _factorial_r(x - 1)
  end


  function _gcd(a::UInt64, b::UInt64)::UInt64
    while (b > 0)
      a, b = b, a % b
    end

    return a
  end

  function _gcd_r(a::UInt64, b::UInt64)::UInt64
    if (b <= 0)
      return a
    end

    return _gcd_r(b, a % b)
  end

  function extended_gcd(a::Int64, b::Int64)::Tuple{Int64, Int64, Int64}
    (old_remainder::Int64, remainder::Int64) = (a, b)
    (y::Int64, y1::Int64) = (0, 1)
    (x::Int64, x1::Int64) = (1, 0)

    while (remainder != 0)
      quot = fld(old_remainder, remainder)
      (old_remainder, remainder) = (remainder, old_remainder - quot * remainder)
      (x, x1) = (x1, x - quot * x1)
      (y, y1) = (y1, y - quot * y1)
    end

    return (old_remainder, x, y)
  end

  function extended_gcd_r(a::Int64, b::Int64)::Tuple{Int64, Int64, Int64}
    if (b == 0)
      return (a, Int64(1), Int64(0))
    end

    (_gcd::Int64, x::Int64, y::Int64) = extended_gcd_r(b, a % b)

    return (_gcd, y, x - y * fld(a, b))
  end

  function diophantine_equation(a::Int64, b::Int64, c::Int64)::PairInt64
    if (a == 0 && b == 0)
      if (c == 0)
        return PairInt64(1, 1, true)
      else
        return PairInt64(0, 0, false)
      end
    end

    (_gcd::Int64, x::Int64, y::Int64) = extended_gcd(a, b)

    if (c % _gcd != 0)
      return PairInt64(0, 0, false)
    end

    return PairInt64(x * fld(c, _gcd), y * fld(c, _gcd), true)
  end

  function diophantine_equation_r(a::Int64, b::Int64, c::Int64)::PairInt64
    if (a == 0 && b == 0)
      if (c == 0)
        return PairInt64(1, 1, true)
      else
        return PairInt64(0, 0, false)
      end
    end

    (_gcd::Int64, x::Int64, y::Int64) = extended_gcd_r(a, b)

    if (c % _gcd != 0)
      return PairInt64(0, 0, false)
    end

    return PairInt64(x * fld(c, _gcd), y * fld(c, _gcd), true)
  end

end