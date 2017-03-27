# numbers

Benchmarks for numbers: ints, doubles, bignums, rationals, etc.

## Running

For all benchmarks:

    $ stack bench :time

<!-- RESULTS -->

## Addition

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|7.588 ns|20.33 ns|0.082 μs|0.598 μs|5.759 μs|0.058 ms|0.577 ms|
|Integer|26.80 ns|160.8 ns|1.424 μs|14.20 μs|140.2 μs|1.410 ms|14.23 ms|
|Rational|114.5 ns|920.7 ns|8.981 μs|89.18 μs|892.8 μs|8.950 ms|89.49 ms|
|Double|7.058 ns|14.15 ns|0.129 μs|1.161 μs|11.60 μs|0.115 ms|1.156 ms|
|Scientific|265.6 ns|1608 ns|15.05 μs|148.1 μs|1479 μs|14.95 ms|147.6 ms|

## Subtraction

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|6.909 ns|19.52 ns|0.082 μs|0.603 μs|5.753 μs|0.058 ms|0.574 ms|
|Integer|29.91 ns|193.6 ns|1.746 μs|17.50 μs|173.8 μs|1.753 ms|17.47 ms|
|Rational|106.0 ns|937.7 ns|9.099 μs|91.50 μs|920.2 μs|9.099 ms|90.76 ms|
|Double|6.506 ns|13.93 ns|0.128 μs|1.160 μs|11.50 μs|0.116 ms|1.151 ms|
|Scientific|246.2 ns|1571 ns|14.22 μs|140.5 μs|1399 μs|14.05 ms|141.1 ms|

