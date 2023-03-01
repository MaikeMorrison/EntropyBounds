## R script accompanying the manuscript, *Mathematical bounds on Shannon entropy given the abundance of the ith most abundant taxon.*

**Maike Morrison and Noah Rosenberg**

The file entropy_bounds.R contains the following functions:

* `H` computes the Shannon entropy of a non-negative vector that sums to 1 (`p`)

* `Hmax_pi` computes the upper bound on Shannon entropy given a vector length (`n`), an index (`i`), and the abundance of the ith largest element of the vector (`pi`)

* `Hmin_pi` computes the lower bound on Shannon entropy given the same inputs as `Hmax_pi`

* `Hmax` computes the upper bound on Shannon entropy given a non-negative vector that sums to 1 (`p`) and an index (`i`)

* `Hmin` computes the lower bound on Shannon entropy given a non-negative vector that sums to 1 (`p`) and an index (`i`)
