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
def fun(arg):
    return sin(2*pi*arg) + sin(4*pi*arg)

T = 1
w = 20
n = T * w

t = linspace(0, T, n, endpoint=False)
signal = fun(t)

plt.figure(figsize=(15,10))
subplot(231)
title("sin(2 * pi * t) + sin(4 * pi * t)")
plot(t, signal, '*')

subplot(232)
title("Dziedzina czestotliwosci")
freqs = linspace(0, w, n, endpoint=False)
signal1 = fft(signal)
z = angle(signal1)
signal1 = abs(signal1)
stem(freqs, signal1, '-*')

subplot(233)
title("Faza")
stem(freqs, z, '-*')
```

# Zadanie 3 - Informacja o fazie


Wykreśl sygnał $sin(2*pi*t) + sin(4*pi*t)$, T=1s, w=20Hz. Tym razem oprócz spektrum, wykreśl wykres z informacją o fazie poszczególnych częstotliwości (faza = arg(z)), gdzie z=a+bi. To samo wykonaj dla sin(2*pi*t) + cos(4*pi*t). Porównaj otrzymane wykresy. Przydatna może być funkcja angle (z parametrem deg=True)

```python
T = 1
w = 20
n = T * w
t = linspace(0, T, n, endpoint=False)

signal = sin(2*pi*t) + cos(4*pi*t)
plt.figure(figsize=(15,10))
subplot(231)
title("sin(2 * pi * t) + cos(4 * pi * t)")
plot(t, signal, '*')

subplot(232)
title("Dziedzina czestotliwosci")
freqs = linspace(0, w, n, endpoint=False)
signal1 = fft(signal)
z = angle(signal1, deg=True)
signal1 = abs(signal1)
stem(freqs, signal1, '-*')

subplot(233)
title("Faza")
stem(freqs, z, '-*')

```

# Zadanie 4 - plik wejsciowy audio


Wczytaj plik err.wav. Wykreśl jego spektrum. Spróbuj także skali logarytmicznej. Określ dominujące w sygnale częstotliwości. Przydatne:

import scipy.io.wavfile

w, signal = scipy.io.wavfile.read('err.wav')

signal = [s[0] for s in signal]   #Tylko pierwszy kanał

yscale(‘log’)

spectrum[::10]        # co 10-ty element


```python pycharm={"name": "#%%\n"}
import scipy.io.wavfile
import itertools

w, original_signal = scipy.io.wavfile.read('err.wav')

def draw_spectrum(sig=0, log_scale = False):
    signal = [s[sig] for s in original_signal]   #Tylko pierwszy kanał

    FFT1 = abs(scipy.fft(signal))
    freqs1=np.linspace(0,w,FFT1.size)

    plt.plot(freqs1[range(len(FFT1)//2)], FFT1[range(len(FFT1)//2)])
    if log_scale:
        plt.yscale('log')

    plt.show()

def get_dominated_freq():
    freqs = rfftfreq(original_signal.size, 1/w)
    signal = abs(rfft(get_canal(0)))/(original_signal.size/2)
    s3 = signal[:]
    sign = 11
    maxx = 0
    temp = 0
    result = []
    while (sign>10):
        tempmax = s3[maxx:].argmax()
        temp += tempmax
        sign = signal[temp]
        if sign>10:
            result.append(str(freqs[temp]))
            maxx = tempmax + 10
    return "\n".join(result)

def get_canal(canal):
    return [s[canal] for s in original_signal]

for log, canal in itertools.product([True, False], [0, 1]):
    plt.figure(figsize=(15,5), dpi=100)
    draw_spectrum(sig=canal, log_scale=log)

print("Dominujące częstotliwości:\n")
print(get_dominated_freq())

```
