'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Zbiór funkcji pomocniczych

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      113752'

source("Generator_liczb_z_rozkladu.R")
library(microbenchmark)


# Parametry funkcji
n <- 10000
mean <- 10
sigma <- 3

accept_reject <- accept_reject(n, mean, sigma)
box_muller <- box_muller_transformation(n, mean, sigma)
chi_square <- chi_square_transformation(n, mean, sigma)
inverse_distribution <- inverse_cumulative_distribution(n, mean, sigma)

# Porównanie rozkładów za pomocą histogramu
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
hist(accept_reject, main = "M. akceptacji-odrzuceń", col = "lightblue", xlim = c(-5, 20))
hist(box_muller, main = "M. transformacji Boxa-Muller", col = "lightgreen", xlim = c(-5, 20))
hist(chi_square, main = "M. transformacji Chi-kwadrat", col = "lightcoral", xlim = c(-5, 20))
hist(inverse_distribution, main = "M. odwróconej dystybuanty", col = "lightgoldenrod", xlim = c(-5, 20))

# Utwórz benchmark
benchmark_results <- microbenchmark::microbenchmark(
  times = 10000,  # Ilość powtórzeń
  accept_reject(n, mean, sigma),
  box_muller_transformation(n, mean, sigma),
  chi_square_transformation(n, mean, sigma),
  inverse_cumulative_distribution(n, mean, sigma)
)

# Wyświetl wyniki
print(benchmark_results)
