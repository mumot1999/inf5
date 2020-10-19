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

```python pycharm={"name": "#%%\n"}
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
%matplotlib inline

x = sym.symbols("x")
```

```python pycharm={"name": "#%%\n"}
exp = ((-x) ** 3 + (3 * (x ** 2)) + 10 * x - 24)
exp

```

```python pycharm={"name": "#%%\n"}
solve = list(sym.solve(exp, x))
print(solve)
indexes = np.arange(-5, 5, 0.1)

plt.plot(
    indexes,
    [exp.evalf(subs={x: index}) for index in indexes],
)
for s in solve:
    plt.annotate(str(s), (s, 0))

plt.margins(0)
plt.grid()
plt.show()
plt.close()
```
