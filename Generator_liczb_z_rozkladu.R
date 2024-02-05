'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Generator liczb losowych z zadanego rozkładu

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      113752
'

#----Generatory liczb losowych z rozkładu normalnego----------------------------
set.seed(10)
library(MASS)

#----Metoda odwrotnej dystrybuanty ----------------

inverse_cumulative_distribution <- function(n, mean, sigma){
  random_N <- numeric(n)
  
  for (i in 1:n){
    u <- runif(1)
    # qnorm przekształca u na wartości z rozkładu normalnego 
    # o zadanych parametrach
    z <- qnorm(u, mean = mean, sd = sigma)
    random_N[i] <- z
    }
  return(random_N)
  }

print(inverse_cumulative_distribution(5, 3, 0.5))


#----Metoda akceptacji i odrzuceń---------------

accept_reject <- function(n, mean, sigma){
  random_N <- numeric(n)

  for (i in 1:n){
    while (TRUE) {
      z <- runif(1)
      u <- runif(1)
      
      if (exp(-z^2 / 2) / sqrt(2 * pi) > u) {
        # Skalowanie o odchylenie i przesunięcie o średnią z zadanego 
        # rozkładu normalnego 
        z <- z * sign(runif(1) - 0.5)
        random_N[i] <- z * sigma + mean
        break
      }}
    }
  return(random_N)
  }

print(accept_reject(5, 3, 0.5))

#----Metoda transformacji CHi^2 -----------------------

chi_square_transformation <- function(n, mean, sigma){
  random_N <- numeric(n)
  
  for (i in 1:n){
    
    # Losowanie liczby z rozkładu Chi^2 z jednym stopniem swobody
    chi_square_random <- rchisq(1, df = 1)
    
    # Obliczenie pierwiastku i definicja znaku (dla zachowania symetrii rozkładu)
    chi_v <- sqrt(chi_square_random) * sign(runif(1) - 0.5)
    
    # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu normalnego 
    random_N[i] <- mean + chi_v * sigma
    }
  return(random_N)
  }

print(chi_square_transformation(5, 3, 0.5))


#----Metoda transformacja Boxa-Mullera--------------

box_muller_transformation <- function(n, mean, sigma) {
  random_N <- numeric(n)
  
  for (i in 1:n){
    u1 <- runif(1)
    u2 <- runif(1)
    
    # Liczba z rozkładu normalnego standaryzowanego N(0,1)
    z1 <- sqrt(-2 * log(u1)) * cos(2 * pi * u2) 
    z2 <- sqrt(-2 * log(u1)) * sin(2 * pi * u2)
    
    # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu normalnego
    if (runif(1) < 0.5) {
      random_N[i] <- z1 * sigma + mean
    } else {
      random_N[i] <- z2 * sigma + mean
    }
    
  }
  return(random_N)
  }

print(box_muller_transformation(5, 3, 0.5))



#----Generator liczb pseudolosowych z d-wymiarowego rozkładu Wisharta----------

generate_wishart <- function(d, n, sigma){
  # d = wymiar rozkładu
  # n = stopnie swobody
  # sigma = macierz kowariancji
  
  if (!(n > d + 1 && d > 1)) {
    stop("Warunek n > d + 1 > 1 nie jest spełniony.")
  }
  # Uzupełniamy macierz Z losowymi liczbami ze standaryzowanego rozkładu normalnego 
  Z <- matrix(rnorm(d * n), nrow = n, ncol = d)
    
  # Faktoryzacja macierzy Z (M = X^T * X)
  Q <- chol(Sigma, pivot = TRUE)
    
  # Przeskalowanie przez macierz kowariancji Σ
  wishart_matrix <- Z %*% Q
  
  return(wishart_matrix)
  }

# ----Analiza Wisharta ------------------------------------------------------

Sigma <- matrix(c(1, 0.5, 0.5, 
                  0.5, 1, 0.5, 
                  0.5, 0.5, 1), 
                nrow = d, ncol = d)

result <- generate_wishart(3, 5, Sigma)

wishart_samples <- rWishart(3, Sigma, df = 5)

print(result)
print(wishart_samples)


#   Obliczenie srednich

re_mean <- colMeans(result)
print(re_mean)
wishart_mean <- colMeans(wishart_samples)
print(wishart_mean)
mean_diff <- mean(result - wishart_mean)
print(mean_diff)

t_test_mean <- t.test(wishart_mean, re_mean)
print(t_test_mean)
