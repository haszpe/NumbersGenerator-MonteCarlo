'
Projekt zaliczeniowy z przedmiotu Statystyczne Modelowanie Danych Biologicznych
Zbiór funkcji pomocniczych

Autorzy projektu:
Hanna Peciak          113752 
Paweł Zakrzewski      113752'

source("Generator_liczb_z_rozkladu.R")
library(microbenchmark)


# Parametry funkcji
n <- 1000
mean <- 10
sigma <- 3

accept_r <- accept_reject(n, mean, sigma)
box_muller <- box_muller_transformation(n, mean, sigma)
chi_square <- chi_square_transformation(n, mean, sigma)
inverse_distribution <- inverse_cumulative_distribution(n, mean, sigma)

# Przedstawienie rozkładów za pomocą histogramu
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
hist(accept_r, main = "M. akceptacji-odrzuceń", col = "lightblue", xlim = c(-5, 20))
hist(box_muller, main = "M. transformacji Boxa-Muller", col = "lightgreen", xlim = c(-5, 20))
hist(chi_square, main = "M. transformacji Chi-kwadrat", col = "lightcoral", xlim = c(-5, 20))
hist(inverse_distribution, main = "M. odwróconej dystybuanty", col = "lightgoldenrod", xlim = c(-5, 20))

# Testowanie wariancji rozkładów
var.test(accept_r, box_muller)
var.test(accept_r, chi_square)
var.test(accept_r, inverse_distribution)
var.test(box_muller, chi_square)
var.test(box_muller, inverse_distribution)
var.test(chi_square, inverse_distribution)

# Benchmark - porównanie czasu wykonywania
benchmark_results <- microbenchmark::microbenchmark(
  times = 1000,
  accept_reject(n, mean, sigma),
  box_muller_transformation(n, mean, sigma),
  chi_square_transformation(n, mean, sigma),
  inverse_cumulative_distribution(n, mean, sigma)
)
print(benchmark_results)
plot(benchmark_results)
