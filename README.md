# sequences

Benchmarks for numbers: ints, doubles, bignums, rationals, etc.

## Running

For all benchmarks:

    $ stack bench :time

<!-- RESULTS -->

## Addition

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Int|29.65 ns|190.5 ns|1698 ns|16.83 μs|168.9 μs|1694 μs|16.94 ms|
|Integer|6.994 ns|16.98 ns|76.02 ns|0.574 μs|5.644 μs|56.35 μs|0.560 ms|

