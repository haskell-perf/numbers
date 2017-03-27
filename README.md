# sequences

Benchmarks for numbers: ints, doubles, bignums, rationals, etc.

## Running

For all benchmarks:

    $ stack bench :time

<!-- RESULTS -->

## Addition

|Name|1|10|100|1000|10000|100000|1000000|
|---|---|---|---|---|---|---|---|
|Integer|30.22 ns|191.0 ns|1746 ns|17.21 μs|174.4 μs|1727 μs|17.60 ms|
|Int|7.547 ns|17.51 ns|80.93 ns|0.599 μs|5.707 μs|57.33 μs|0.575 ms|

