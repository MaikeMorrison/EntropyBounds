# Functions for Shannon entropy and its bounds given the ith largest vector entry
# Maike Morrison & Noah Rosenberg

# Accompanies paper: 
    # Mathematical bounds on Shannon entropy 
    # given the abundance of the ith most abundant taxon

# install.packages("dplyr")
library(dplyr)

# Define -p_i*log(p_i) for a single observation (so that -0log0=0)
neg_p_logp <- function(pi){if(is.na(pi)){NA} else if (pi==1){0} else if (pi==0){0} else{-pi*log(pi)}}

# Define Shannon entropy on a vector
H <- function(p){if(any(p==1)){0}else{sum(sapply(p, neg_p_logp))}}


# Define upper bound as a function of the ith most frequent taxon
Hmax_pi <- function(n, i, pi){
  # n: length of vector
  # i: index of most ith frequent taxon you wish to condition on
  # pi: abundance of ith most frequent taxon you wish to condition on
  
  if(n == 1){
    0
  }
  else if (n >= ceiling(1/pi)) {
    i * neg_p_logp(pi) + (n-i) * neg_p_logp((1-i*pi)/(n-i))
  }
  else {
    (i-1)*neg_p_logp((1-(n-i+1)*pi)/(i-1)) + (n-i+1) * neg_p_logp(pi)
  }
}


# Same upper bound, but computed for a vector p and an index i
Hmax <- function(p, i){
  # p: vector of taxa relative abundances
  # i: index of most frequent taxon you wish to condition on
  p_sort <- sort(unlist(p)) %>% rev
  Hmax_pi(length(p_sort), i, p_sort[i])
}


# Define lower bound as a function of the ith most frequent taxon
Hmin_pi <- function(n, i, pi){
  # n: length of vector
  # i: index of ith most frequent taxon you wish to condition on
  # pi: abundance of ith most frequent taxon you wish to condition on
  if (i == 1) {
    ceiling(1/pi-1)* neg_p_logp(pi) + neg_p_logp(1-ceiling(1/pi-1)*pi)
  } else {
    neg_p_logp(1-(i-1)*pi)+(i-1)*neg_p_logp(pi)
  }
}

# Same lower bound, but computed for a vector of taxa abundances p and an index i
Hmin <- function(p, i){
  # p: vector of taxa relative abundances
  # i: index of most frequent taxon you wish to condition on
  p_sort <- sort(unlist(p)) %>% rev
  Hmin_pi(length(p_sort), i, p_sort[i])
}
