load('NumericalSemigroup.sage')

'''
helper function
get element from a list with elements Tuple[Integer, List[Integer]]
by the first entry of the tuple.
'''
def ind(gens, n):
    for gen in gens:
        if gen[0] == n:
            return gen
    return ()

'''
useful for later
'''
def gcd(f, g):
    f_index = f[0]
    f_factors = f[1]
    g_index = g[0]
    g_factors = g[1]
    if (f_index != g_index):
        print(f"The powers of $t$ didn't match for inputs f:{f} and g:{g}")
    return (f_index, [factor for factor in f_factors if factor in g_factors])

'''
useful for later
'''
def multiply(f, g):
    f_index = f[0]
    f_factors = f[1]
    g_index = g[0]
    g_factors = g[1]
    return (f_index + g_index, [factor - g_index for factor in f_factors] + g_factors)

'''
Create an initial generating set for the ring of differential operators
for the numerical semigroup with generators S. Theorem A from the Eriksen paper.
Parameters: S (NumericalSemigroup) - a numerical semigroup
Output: gens (List[Tuple[Integer, List[Integer]]]) - a list capturing a generating
    set of D(k[S]), the ring of differential operators over k[S].
'''
def initial_gen_set(S):
    indices = S.gens + S.Gaps()
    neg_indices = [-ele for ele in indices]
    all_indices = neg_indices + [0] + indices
    return sorted([(index, extended_apery_set(S, -1*index)) for index in all_indices])

'''
Allows one to compute Apery sets for elements not in the numerical semigroup S
'''
def extended_apery_set(S, n):
    if (S.Contains(n) and n != 0):
        return S.AperySet(n)
    else:
        # captures all elements, s, of S such that s - n < 0
        lands_below_zero = [m for m in range(n) if S.Contains(m)]
        # captures all elements, s, of S such that s - n \in S.Gaps()
        lands_in_gap_set = [gap + n for gap in S.Gaps() if S.Contains(gap + n)]
        return lands_below_zero + lands_in_gap_set

'''
useful for later
'''
def pruned_gen_set(S):
    initial_set = initial_gen_set(S)
    initial_indices = [gen[0] for gen in initial_set]
    smgp_gens = [gen for gen in initial_set if S.Contains(gen[0])]
    return


###############################################################################
# TESTING
###############################################################################

S = NumericalSemigroup([2, 3])
gens = initial_gen_set(S)
#print(gens)

# -3 + 2 = -1
f = ind(gens, -3)
g = ind(gens, 2)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# 2 + -1 = 1
f = ind(gens, 2)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 1 = -2
f = ind(gens, -3)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

## if S = \< 2, 3 \>, then [-3, 0, 2, 3] generates D(k[S])
## OR
## if S = \< 2, 3 \>, then [-2, 0, 2, 3] generates D(k[S]) (below)

# -2 + 3 = 1
f = ind(gens, -2)
g = ind(gens, 3)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -2 + 1 = -1
f = ind(gens, -2)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -2 + -1 = -3
f = ind(gens, -2)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

###############################################################################

T = NumericalSemigroup([3, 4])
gens = initial_gen_set(T)
#print(gens)

# -3 + 4 = 1
f = ind(gens, -3)
g = ind(gens, 4)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# 1 + 4 = 5
f = ind(gens, 1)
g = ind(gens, 4)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 5 = 2
f = ind(gens, -3)
g = ind(gens, 5)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 2 = -1
f = ind(gens, -3)
g = ind(gens, 2)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 1 = -2
f = ind(gens, -3)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + -2 = -5
f = ind(gens, -3)
g = ind(gens, -2)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + -1 = -4
f = ind(gens, -3)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

## if T = \< 3, 4 \>, then [-3, 0, 3, 4] generates D(k[T])
## Note: Choosing [-5, 0, 3, 4] does not generate D(k[T])

###############################################################################

S = NumericalSemigroup([3, 4, 5])
gens = initial_gen_set(S)
print(gens)

# -3 + 4 = 1
f = ind(gens, -3)
g = ind(gens, 4)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 5 = 2
f = ind(gens, -3)
g = ind(gens, 5)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 2 = -1
f = ind(gens, -3)
g = ind(gens, 2)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 1 = -2
f = ind(gens, -3)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + -1 = -4
f = ind(gens, -3)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + -2 = -5
f = ind(gens, -3)
g = ind(gens, -2)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

## if S = \< 3, 4, 5 \>, then [-3, 0, 3, 4, 5] generates D(k[S])

# -4 + 3 = -1
f = ind(gens, -4)
g = ind(gens, 3)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -4 + 5 = 1
f = ind(gens, -4)
g = ind(gens, 5)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -4 + -1 = -5
f = ind(gens, -4)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -4 + 1 = -3
f = ind(gens, -4)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# -3 + 1 = -2
f = ind(gens, -3)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

# 3 + -1 = 2
f = ind(gens, 3)
g = ind(gens, -1)
com1 = multiply(f, g)
com2 = multiply(g, f)
#print(gcd(com1, com2))

## if S = \< 3, 4, 5 \>, then [-4, 0, 3, 4, 5] generates D(k[S])

# -5 + 3 = -2
f = ind(gens, -5)
g = ind(gens, 3)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

# -5 + 4 = -1
f = ind(gens, -5)
g = ind(gens, 4)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

# -2 + 3 = 1
f = ind(gens, -2)
g = ind(gens, 3)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

# -2 + 4 = 2
f = ind(gens, -2)
g = ind(gens, 4)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

# -5 + 1 = -4
f = ind(gens, -5)
g = ind(gens, 1)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

# -5 + 2 = -3
f = ind(gens, -5)
g = ind(gens, 2)
com1 = multiply(f, g)
com2 = multiply(g, f)
print(gcd(com1, com2))

## if S = \< 3, 4, 5 \>, then [-5, 0, 3, 4, 5] generates D(k[S])