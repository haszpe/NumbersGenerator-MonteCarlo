'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Generator liczb losowych z zadanego rozkładu

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      ......'

#----Wczytanie funkcji----------------------------------------------------------

source("Functions.R")
set.seed(10)

#----Generatory liczb losowych z rozkładu normalnego----------------------------

#----Metoda dystrybuanty odwrotnej--------------
# Z wykorzystaniem algorytmu Boxa-Mullera

inverse_cumulative_distribution <- function(n, mean, sigma) {
  random_N <- numeric(n)
  
  for (i in 1:n){
    u1 <- runif(1)
    u2 <- runif(1)
    
    # Liczba z rozkładu normalnego standaryzowanego
    z <- sqrt(-2 * log(u1)) * cos(2 * pi * u2) 
    
    # Skalowanie o odchylenie i przesunięcie o średnią z zadanego rozkładu
    random_N[i] <- z * sigma + mean
  }
  
  return(random_N)
}

print(inverse_cumulative_distribution(5, 3, 0.5))


#----Metoda akceptacji i odrzuceń---------------





#----Metoda transformacji-----------------------




#----Sumy i mieszaniny rozkładów----------------



#----Generator liczb pseudolosowych z d-wymiarowego rozkładu Wisharta-----------

