load('NumericalSemigroup.sage')

'''
useful for later
'''
def gcd(f, g):
    f_index = f[0]
    f_factors = f[1]
    g_index = g[0]
    g_factors = g[1]
    return (f_index, [factor for factor in f_factors if factor in g_factors])

print(gcd((2, [0, 2, 4]), (2, [0, -2, -4])))

'''
useful for later
'''
def multiply(f, g):
    f_index = f[0]
    f_factors = f[1]
    g_index = g[0]
    g_factors = g[1]
    return (f_index + g_index, [factor - g_index for factor in f_factors] + g_factors)

print(multiply((-3, [0, 2, 4]), (4, [])))
print(multiply((4, []), (-3, [0, 2, 4])))

'''
useful for later
'''
def pruned_gen_set():
    pass

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
        # captues all elements, s, of S such that s - n \in S.Gaps()
        lands_in_gap_set = [gap + n for gap in S.Gaps() if S.Contains(gap + n)]
        return lands_below_zero + lands_in_gap_set

S = NumericalSemigroup([2, 3])
print(initial_gen_set(S))
