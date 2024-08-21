load('NumericalSemigroup.sage')

'''
useful for later
'''
def gcd(f, g):
    pass

'''
useful for later
'''
def multiply(f, g):
    pass

'''
useful for later
'''
def pruned_gen_set():
    pass

'''
Create an initial generating set for the ring of differential operators
for the numerical semigroup with generators S. Using Theorem A from the
Eriksen paper
Parameters: S (NumericalSemigroup) - a numerical semigroup
Output: all_indices (List[Integer]) - a list capturing a generating set of D(k[S]),
    the ring of differential operators over k[S].
'''
def initial_gen_set(S):
    indices = S.gens + S.Gaps()
    neg_indices = [-ele for ele in indices]
    all_indices = neg_indices + [0] + indices
    return sorted(all_indices)

'''
Allows one to compute Apery sets for elements not in the numerical semigroup S
'''
def extended_apery_set(S, n):
    if (S.Contains(n)):
        return S.AperySet(n)
    else:
        # captures all elements, s, of S such that s - n < 0
        lands_below_zero = [m for m in range(n) if S.Contains(m)]
        # captues all elements, s, of S such that s - n \in S.Gaps()
        lands_in_gap_set = [gap + n for gap in S.Gaps() if S.Contains(gap + n)]
        return lands_below_zero + lands_in_gap_set

S = NumericalSemigroup([3, 4])
print(initial_gen_set(S))