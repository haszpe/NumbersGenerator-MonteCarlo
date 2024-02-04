'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Generator liczb losowych z zadanego rozkładu

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      113752
'

#----Wczytanie funkcji----------------------------------------------------------

source("Functions.R")
set.seed(10)


#----Generatory liczb losowych z rozkładu normalnego----------------------------



#----Metoda odwrotnej dystrybuanty ----------------

inverse_cumulative_distribution <- function(n, mean, sigma){
  random_N <- numeric(n)
  
  for (i in i:n){
    
    u <- runif(n)
    
    # qnorm przekształca u na wartości z rozkładu normalnego o zadanych parametrach
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
        
        # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu normalnego 
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
  
  for (i in i:n){
    
    # Losowanie liczby z rozkładu Chi^2 z jendym stopniem swobody
    chi_square_random <- rchisq(1, df = 1)
    
    # Obliczenie pierwiastku i definicja znaku (dla zachowania symetrii rozkładu)
    chi_v <- sqrt(chi_squared_values) * sign(runif(1) - 0.5)
    
    # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu normalnego 
    random_N[i] <- mean + chi_v * sigma
    }
  return(random_N)
  }


#----Metoda transformacja Boxa-Mullera--------------

box_muller_transformation <- function(n, mean, sigma) {
  random_N <- numeric(n)
  
  for (i in 1:n){
    u1 <- runif(1)
    u2 <- runif(1)
    
    # Liczba z rozkładu normalnego standaryzowanego N(0,1)
    z <- sqrt(-2 * log(u1)) * cos(2 * pi * u2) 
    z2 <- sqrt(-2 * log(u1)) * sin(2 * pi * u2)
    
    # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu normalnego
    random_N[i] <- z * sigma + mean
    }
  
  return(random_N)
  }

print(box_muller_transformation(5, 3, 0.5))






#----Generator liczb pseudolosowych z d-wymiarowego rozkładu Wisharta-----------

