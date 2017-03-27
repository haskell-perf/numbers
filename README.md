# sequences

Benchmarks for numbers: ints, doubles, bignums, rationals, etc.

## Running

For all benchmarks:

    $ stack bench :time

<!-- RESULTS -->

## Addition

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|0.000 s|2331695 s|0.082 μs|0.598 μs|5.759 μs|0.058 ms|0.577 ms|
|Integer|0.000 s|0.000 s|1.424 μs|14.20 μs|140.2 μs|1.410 ms|14.23 ms|
|Rational|0.000 s|0.000 s|8.981 μs|89.18 μs|892.8 μs|8.950 ms|89.49 ms|
|Double|758260 s|0.000 s|0.129 μs|1.161 μs|11.60 μs|0.115 ms|1.156 ms|
|Scientific|0.000 s|0.000 s|15.05 μs|148.1 μs|1479 μs|14.95 ms|147.6 ms|

## Subtraction

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|0.000 s|19.52 ns|0.000 s|63192119 s|5.753 μs|0.000 s|0.001 s|
|Integer|0.000 s|193.6 ns|0.000 s|0.000 s|173.8 μs|0.002 s|0.017 s|
|Rational|160157833 s|937.7 ns|998590774 s|0.000 s|920.2 μs|9.9898e10 s|9.7627e12 s|
|Double|0.000 s|13.93 ns|0.000 s|0.000 s|11.50 μs|0.000 s|0.001 s|
|Scientific|0.000 s|1571 ns|0.000 s|0.000 s|1399 μs|0.014 s|0.141 s|

