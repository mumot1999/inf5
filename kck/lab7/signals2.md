---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.2'
      jupytext_version: 1.6.0
  kernelspec:
    display_name: PyCharm (inf5)
    language: python
    name: pycharm-8a6a632c
---

# Zadanie 1 - aktywnosc slonca


Plik spots.txt zawiera wartości aktywności Słońca w kolejnych miesiącach. Wykreśl ten sygnał oraz jego spektrum. Za pomocą FFT, oblicz częstotliwość cyklu aktywności słonecznej.  Przydatne mogą być następujące konstrukcje:

array = genfromtxt(‘spots.txt’)  (lub array=[float(x) for x in open('spots.txt').read().split()])

x = max(array)

```python
from pylab import *

dane = np.genfromtxt("spots.txt")

plt.figure(figsize=(10,10))

subplot(211)
plt.xlabel('n')
plt.ylabel('aktywność')

plot(dane)


subplot(212)
plt.xlabel('częstotliwość')
plt.ylabel('spektrum')

spectrum=abs(fft(dane))
freq=np.linspace(0,12,spectrum.size)
stem(freq,spectrum,'r')
spectrum[0]=0
maxf=freq[argmax(spectrum)]
print("Częstotliwość cyklu aktywności słoneczej", maxf)
```

# Zadanie 2 - proste filtrowanie


Wykreśl sygnał $sin(2*pi*t) + sin(4*pi*t)$, T=1s, w=20Hz. Za pomocą FFT, przekształć sygnał do dziedziny częstotliwości. Następnie usuń składowe o częstotliwości 2Hz. Tak zmodyfikowany sygnał przekształć do dziedziny czasu i wykreśl go.

```python

```

# Zadanie 3 - Informacja o fazie


Wykreśl sygnał $sin(2*pi*t) + sin(4*pi*t)$, T=1s, w=20Hz. Tym razem oprócz spektrum, wykreśl wykres z informacją o fazie poszczególnych częstotliwości (faza = arg(z)), gdzie z=a+bi. To samo wykonaj dla sin(2*pi*t) + cos(4*pi*t). Porównaj otrzymane wykresy. Przydatna może być funkcja angle (z parametrem deg=True)

```python

```

# Zadanie 4 - plik wejsciowy audio


Wczytaj plik err.wav. Wykreśl jego spektrum. Spróbuj także skali logarytmicznej. Określ dominujące w sygnale częstotliwości. Przydatne:

import scipy.io.wavfile

w, signal = scipy.io.wavfile.read('err.wav')

signal = [s[0] for s in signal]   #Tylko pierwszy kanał

yscale(‘log’)

spectrum[::10]        # co 10-ty element


```python

```
