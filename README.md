# Projekt zaliczeniowy na zajęcia Statystyczne Modelowanie Danych Biologicznych

Autorzy:
- Hanna Pęciak
- Paweł Zakrzewski

## Cel projektu

- Zaprezentowanie czterech metod generowania liczb losowych z rozkładu normalnego o zadanych parametrach
    - metodą odwrotnej dystrybuanty
      
          Losowanie liczby z rozkładu jednostajnego na odcinku (0,1) następnie za pomocą wbudowanej funkcji 
          qnorm(), będącą funkcją odwróconej dystrybuanty, przekształcić wybraną zmienną na wartość z rozkładu
          normalnego o zadanych parametrach.

    - metodą akceptacji i odrzuceń
      
          Losowanie dwóch liczb z rozkładu jednostajnego na odcinku (0,1) następnie jedna
          zmienna jest porównywana z wartością funkcji gęstości prawdopodobieńśtwa rozkładu
          normalnego standaryzowanego w punkcie drugiej zmiennej. W przypadku gdy wartość pierwszej przewyższa
          wartość drugiej przyjmujemy drugą za zmienną losową z rozkładu normalnego standaryzowanego, ostatnim
          etapem jest przeskalowanie zmiennej o wariancję i przesunięcie o średnią. 

    - metodą transformacji $chi^2$
      
          Losowanie liczby z rozkładu Chi-kwadrat o jednym stopniu swobody. Zmienna jest pierwiastkowana,
          a dla zachowania symetrii rozkładu przemnażana przez losowy znak. Z założeń rozkładu Chi-kwadrat wynika,
          że takie przekształcenie powinno generować zmienne o standaryzowanym rozkładzie normalnym. Po przeskalowaniu
          o wariancję i przesunięcią o średnią otrzymujemy zmienną z rozkładu normalnego o zadanych parametrach. 

    - metodą Box'a-Mullera
      
          Losowanie dwóch liczb z rozkładu jednostajnego na odcinku (0,1) które zostają przekształcone na niezależne
          zmienne z rozkładu normalnego standaryzowanego w oparciu o własności funkcji gęstości prawdopodobieńśtwa
          dwóch niezależnych zmiennych losowych. Po transformacji, losowo wybierana jest zmienna wynikowa, która
          zostaje następnie przeskalowana o wariancję i przesunięta o średnią, generując tym samym zmienne z rozkładu
          normalnego o zadanych parametrach.
          
- Metoda generowania liczb pseudolosowych z d-wymiarowego rozkładu Wisharta
- Porównanie dwóch metod przybliżania liczby $\pi$ z wykorzystaniem metody Monte Carlo

