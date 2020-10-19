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

```python pycharm={"name": "#%%\n"}
#1.2
```

```python pycharm={"name": "#%%\n"}
# 1.2
from sympy.interactive import printing
printing.init_printing(use_latex=True)

x, y = sym.symbols("x y")

eq1 = sym.Eq(x**2 + 3*y, 10)
eq2 = sym.Eq(4*x - y**2, -2)
solutions = sym.solve((eq1, eq2), (x, y))

print(solutions)

len(solutions)

print("solutions:")
for sol in solutions:
    for v in sol:
        print(v, '=', v.evalf())
```

```python pycharm={"name": "#%%\n"}
from sympy import (sin, log, cos)

diff_exp = sin(log(x, 2)) * cos(x ** 2) / x
diff_exp.diff(x)
```
