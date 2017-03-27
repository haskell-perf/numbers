# sequences

Benchmarks for numbers: ints, doubles, bignums, rationals, etc.

## Running

For all benchmarks:

    $ stack bench :time

<!-- RESULTS -->

## Addition

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|6.860 ns|17.03 ns|77.16 ns|0.586 μs|5.756 μs|57.82 μs|0.572 ms|
|Integer|27.14 ns|165.1 ns|1469 ns|14.58 μs|144.8 μs|1431 μs|14.34 ms|

## Subtraction

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|6.994 ns|16.98 ns|76.02 ns|0.574 μs|5.644 μs|56.35 μs|0.560 ms|
|Integer|29.65 ns|190.5 ns|1698 ns|16.83 μs|168.9 μs|1694 μs|16.94 ms|
