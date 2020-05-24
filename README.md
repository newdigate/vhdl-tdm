# vhdl-tdm
decode 16-ch/ 16 bits-per-sample TDM audio stream

# ghdl
```
ghdl -a --ieee=synopsys -fexplicit TDM_decoder.vhdl
ghdl -a --ieee=synopsys -fexplicit counter_tb.vhdl
ghdl -r counter_tb --stop-time=3250ns --vcd=wave.vcd
```
