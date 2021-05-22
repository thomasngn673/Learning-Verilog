# How to use Icarus Verilog + GTKWave on MacOS

1. Create initial Verilog files and test bench.

2. Open terminal/command line.

3. Create .vvp file of test bench code by entering:

``` Bash
iverilog -o file_tb.vvp file_tb.v
```

* Must include exact test bench file name when creating .vvp file

4. Create waveform file of .vvp file by entering:

``` Bash
vvp file_tb.vvp
```

5. Allow GTKWave to run by changing *System Preferences* if not already changed.

6. Open .vcd waveform file with GTKWave.

7. Select all signals in GTKWave and press **"append"** to view waveforms.
