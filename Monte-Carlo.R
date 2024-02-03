'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Opracowanie metody Monte-Carlo

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      ......'

#----Wczytanie funkcji----------------------------------------------------------

source("Functions.R")

#----Metoda Monte-Carlo-----------------------------------------------------------
#Przyblizenia liczby pi przy pomocy metdoy Monte Carlo
#Metoda 1  Sprawdzanie czy losowe punkty mieszcza sie  w kole, ktore jest wpisane  w kwadrat 
mc1 <- function(n) {
  
  punkty <- matrix(runif(2 * n, -1, 1), ncol = 2)
  kolo <- punkty[, 1]^2 + punkty[, 2]^2 <= 1
  przyblizone_pi <- 4 * sum(kolo) / n
  
  return(przyblizone_pi)
}

#Metoda 2 Sprawdzanie czy losowe punkty mieszcza sie w kwadracie ktory jest opisany przez kolo

mc2 <- function(n) {

  punkty <- matrix(runif(2 * n, -1, 1), ncol = 2)
  kolo <- punkty[, 1]^2 + punkty[, 2]^2 <= 1
  kwadrat <- abs(punkty[, 1]) <= 1 & abs(punkty[, 2]) <= 1
  przyblizone_pi <- 4 * sum(kolo) / sum(kwadrat)
  
  return(przyblizone_pi)
}

# Porownanie

n <- 10000000
system.time({
por_mc1 <- mc1(n)
print(paste("Metoda 1: ", por_mc1))
})
system.time({
por_mc2 <- mc2(n)
print(paste("Metoda 2: ", por_mc2))
})


