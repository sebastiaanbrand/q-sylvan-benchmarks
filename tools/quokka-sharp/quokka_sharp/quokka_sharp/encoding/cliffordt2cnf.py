# This code was generated by cliffordt2cnf_py_codegen.py.

# Equivalent(R, r ^ (x[k] & z[k]))
def H2CNF(cnf, k):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([ R,  r, -x[k], -z[k]])
    cnf.add_clause([-R, -r, -x[k], -z[k]])
    x[k], z[k] = z[k], x[k]

    cnf.vars.r = R

# Equivalent(R, r ^ (x[k] & z[k]))
# Equivalent(Z, x[k] ^ z[k])
def S2CNF(cnf, k):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([ R,  r, -x[k], -z[k]])
    cnf.add_clause([-R, -r, -x[k], -z[k]])

    Z = cnf.add_var()
    cnf.add_clause([ Z,  x[k], -z[k]])
    cnf.add_clause([ Z, -x[k],  z[k]])
    cnf.add_clause([-Z,  x[k],  z[k]])
    cnf.add_clause([-Z, -x[k], -z[k]])

    cnf.vars.z[k] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ z[k])
def X2CNF(cnf, k):
    r = cnf.vars.r
    z = cnf.vars.z
    R = cnf.add_var()
    cnf.add_clause([ R,  r, -z[k]])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([-R, -r, -z[k]])

    cnf.vars.r = R

# Equivalent(R, r ^ x[k] ^ z[k])
def Y2CNF(cnf, k):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    cnf.add_clause([ R,  r,  x[k], -z[k]])
    cnf.add_clause([ R,  r, -x[k],  z[k]])
    cnf.add_clause([ R, -r,  x[k],  z[k]])
    cnf.add_clause([-R,  r,  x[k],  z[k]])
    cnf.add_clause([ R, -r, -x[k], -z[k]])
    cnf.add_clause([-R,  r, -x[k], -z[k]])
    cnf.add_clause([-R, -r,  x[k], -z[k]])
    cnf.add_clause([-R, -r, -x[k],  z[k]])

    cnf.vars.r = R

# Equivalent(R, r ^ x[k])
def Z2CNF(cnf, k):
    r = cnf.vars.r
    x = cnf.vars.x
    R = cnf.add_var()
    cnf.add_clause([ R,  r, -x[k]])
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([-R, -r, -x[k]])

    cnf.vars.r = R

# Equivalent(R, r ^ (x[k] & ~z[k]))
# Equivalent(Z, x[k] ^ z[k])
def Sdg2CNF(cnf, k):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([ R, -r, -z[k]])
    cnf.add_clause([-R,  r, -z[k]])
    cnf.add_clause([ R,  r, -x[k],  z[k]])
    cnf.add_clause([-R, -r, -x[k],  z[k]])

    Z = cnf.add_var()
    cnf.add_clause([ Z,  x[k], -z[k]])
    cnf.add_clause([ Z, -x[k],  z[k]])
    cnf.add_clause([-Z,  x[k],  z[k]])
    cnf.add_clause([-Z, -x[k], -z[k]])

    cnf.vars.z[k] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ (x[k] & z[k] & ~Z))
# x[k] | (Equivalent(Z, z[k]))
# Equivalent(u, x[k])
def T2CNF(cnf, k, w):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    Z = cnf.add_var()
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([ R, -Z, -r])
    cnf.add_clause([-R, -Z,  r])
    cnf.add_clause([ R,  Z,  r, -x[k], -z[k]])
    cnf.add_clause([-R,  Z, -r, -x[k], -z[k]])

    cnf.add_clause([ Z,  x[k], -z[k]])
    cnf.add_clause([-Z,  x[k],  z[k]])

    u = cnf.add_var()
    cnf.add_clause([ u, -x[k]])
    cnf.add_clause([-u,  x[k]])
    cnf.add_weight(u, w)
    cnf.add_weight(-u, 1)

    cnf.vars.z[k] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ (Z & x[k] & ~z[k]))
# x[k] | (Equivalent(Z, z[k]))
# Equivalent(u, x[k])
def Tdg2CNF(cnf, k, w):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    Z = cnf.add_var()
    cnf.add_clause([ R,  Z, -r])
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([-R,  Z,  r])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([ R, -r, -z[k]])
    cnf.add_clause([-R,  r, -z[k]])
    cnf.add_clause([ R, -Z,  r, -x[k],  z[k]])
    cnf.add_clause([-R, -Z, -r, -x[k],  z[k]])

    cnf.add_clause([ Z,  x[k], -z[k]])
    cnf.add_clause([-Z,  x[k],  z[k]])

    u = cnf.add_var()
    cnf.add_clause([ u, -x[k]])
    cnf.add_clause([-u,  x[k]])
    cnf.add_weight(u, w)
    cnf.add_weight(-u, 1)

    cnf.vars.z[k] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ (x[c] & z[t] & (z[c] ^ ~x[t])))
# Equivalent(X, x[c] ^ x[t])
# Equivalent(Z, z[c] ^ z[t])
def CNOT2CNF(cnf, c, t):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    Z = cnf.add_var()
    X = cnf.add_var()
    cnf.add_clause([ R, -r,  x[c]])
    cnf.add_clause([ R, -r,  z[t]])
    cnf.add_clause([-R,  r,  x[c]])
    cnf.add_clause([-R,  r,  z[t]])
    cnf.add_clause([ R, -r,  x[t], -z[c]])
    cnf.add_clause([ R, -r, -x[t],  z[c]])
    cnf.add_clause([-R,  r,  x[t], -z[c]])
    cnf.add_clause([-R,  r, -x[t],  z[c]])
    cnf.add_clause([ R,  r, -x[c],  x[t],  z[c], -z[t]])
    cnf.add_clause([ R,  r, -x[c], -x[t], -z[c], -z[t]])
    cnf.add_clause([-R, -r, -x[c],  x[t],  z[c], -z[t]])
    cnf.add_clause([-R, -r, -x[c], -x[t], -z[c], -z[t]])

    cnf.add_clause([ X,  x[c], -x[t]])
    cnf.add_clause([ X, -x[c],  x[t]])
    cnf.add_clause([-X,  x[c],  x[t]])
    cnf.add_clause([-X, -x[c], -x[t]])

    cnf.add_clause([ Z,  z[c], -z[t]])
    cnf.add_clause([ Z, -z[c],  z[t]])
    cnf.add_clause([-Z,  z[c],  z[t]])
    cnf.add_clause([-Z, -z[c], -z[t]])
    cnf.vars.x[t] = X
    cnf.vars.z[c] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ (x[c] & x[t] & (z[c] ^ z[t])))
# Equivalent(X, x[c] ^ x[t])
# Equivalent(Z, z[c] ^ z[t])
def CZ2CNF(cnf, c, t):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    Z1 = cnf.add_var()
    Z2 = cnf.add_var()
    cnf.add_clause([ R, -r,  x[c]])
    cnf.add_clause([ R, -r,  x[t]])
    cnf.add_clause([-R,  r,  x[c]])
    cnf.add_clause([-R,  r,  x[t]])
    cnf.add_clause([ R, -r,  z[c],  z[t]])
    cnf.add_clause([-R,  r,  z[c],  z[t]])
    cnf.add_clause([ R, -r, -z[c], -z[t]])
    cnf.add_clause([-R,  r, -z[c], -z[t]])
    cnf.add_clause([ R,  r, -x[c], -x[t],  z[c], -z[t]])
    cnf.add_clause([ R,  r, -x[c], -x[t], -z[c],  z[t]])
    cnf.add_clause([-R, -r, -x[c], -x[t],  z[c], -z[t]])
    cnf.add_clause([-R, -r, -x[c], -x[t], -z[c],  z[t]])

    cnf.add_clause([ Z1,  x[t], -z[c]])
    cnf.add_clause([ Z1, -x[t],  z[c]])
    cnf.add_clause([-Z1,  x[t],  z[c]])
    cnf.add_clause([-Z1, -x[t], -z[c]])

    cnf.add_clause([ Z2,  x[c], -z[t]])
    cnf.add_clause([ Z2, -x[c],  z[t]])
    cnf.add_clause([-Z2,  x[c],  z[t]])
    cnf.add_clause([-Z2, -x[c], -z[t]])

    cnf.vars.z[c] = Z1
    cnf.vars.z[t] = Z2
    cnf.vars.r = R

# Equivalent(R, r ^ (x[k] & z[k] & ~Z))
# x[k] | (Equivalent(Z, z[k]))
# Equivalent(u, x[k])
def RZ2CNF(cnf, k, cos_theta, sin_theta):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    Z = cnf.add_var()
    cnf.add_clause([ R, -r,  x[k]])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  r,  x[k]])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([ R, -Z, -r])
    cnf.add_clause([-R, -Z,  r])
    cnf.add_clause([ R,  Z,  r, -x[k], -z[k]])
    cnf.add_clause([-R,  Z, -r, -x[k], -z[k]])

    cnf.add_clause([ Z,  x[k], -z[k]])
    cnf.add_clause([-Z,  x[k],  z[k]])

    u1 = cnf.add_var()
    cnf.add_clause([-u1,  x[k]])
    cnf.add_clause([ Z, -u1, -z[k]])
    cnf.add_clause([-Z, -u1,  z[k]])
    cnf.add_clause([ Z,  u1, -x[k],  z[k]])
    cnf.add_clause([-Z,  u1, -x[k], -z[k]])
    cnf.add_weight( u1, cos_theta)
    cnf.add_weight(-u1, 1)

    u2 = cnf.add_var()
    cnf.add_clause([-u2,  x[k]])
    cnf.add_clause([ Z, -u2,  z[k]])
    cnf.add_clause([-Z, -u2, -z[k]])
    cnf.add_clause([ Z,  u2, -x[k], -z[k]])
    cnf.add_clause([-Z,  u2, -x[k],  z[k]])
    cnf.add_weight( u2, sin_theta)
    cnf.add_weight(-u2, 1)
    cnf.vars.z[k] = Z
    cnf.vars.r = R

# Equivalent(R, r ^ (X & z[k] & ~x[k]))
# z[k] | (Equivalent(X, x[k]))
# Equivalent(u, x[k])
def RX2CNF(cnf, k, cos_theta, sin_theta):
    r = cnf.vars.r
    x = cnf.vars.x
    z = cnf.vars.z
    R = cnf.add_var()
    X = cnf.add_var()
    cnf.add_clause([ R,  X, -r])
    cnf.add_clause([ R, -r,  z[k]])
    cnf.add_clause([-R,  X,  r])
    cnf.add_clause([-R,  r,  z[k]])
    cnf.add_clause([ R, -r, -x[k]])
    cnf.add_clause([-R,  r, -x[k]])
    cnf.add_clause([ R, -X,  r,  x[k], -z[k]])
    cnf.add_clause([-R, -X, -r,  x[k], -z[k]])

    cnf.add_clause([ X, -x[k],  z[k]])
    cnf.add_clause([-X,  x[k],  z[k]])

    u1 = cnf.add_var()
    cnf.add_clause([-u1,  z[k]])
    cnf.add_clause([ X, -u1, -x[k]])
    cnf.add_clause([-X, -u1,  x[k]])
    cnf.add_clause([ X,  u1,  x[k], -z[k]])
    cnf.add_clause([-X,  u1, -x[k], -z[k]])
    cnf.add_weight( u1, cos_theta)
    cnf.add_weight(-u1, 1)

    u2 = cnf.add_var()
    cnf.add_clause([-u2,  z[k]])
    cnf.add_clause([ X, -u2,  x[k]])
    cnf.add_clause([-X, -u2, -x[k]])
    cnf.add_clause([ X,  u2, -x[k], -z[k]])
    cnf.add_clause([-X,  u2,  x[k], -z[k]])
    cnf.add_weight( u2, sin_theta)
    cnf.add_weight(-u2, 1)
    cnf.vars.x[k] = X
    cnf.vars.r = R
