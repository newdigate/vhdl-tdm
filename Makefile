# Makefile borrowed from https://github.com/cliffordwolf/icestorm/blob/master/examples/icestick/Makefile
#
# The following license is from the icestorm project and specifically applies to this file only:
#
#  Permission to use, copy, modify, and/or distribute this software for any
#  purpose with or without fee is hereby granted, provided that the above
#  copyright notice and this permission notice appear in all copies.
#
#  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PROJ = top

PIN_DEF = tinyfpga/pins.pcf
DEVICE = lp8k

all: $(PROJ).asc

files := $(shell find . -name \*.vhdl)

.PHONY: ${files}
${files}: ; ghdl -a $@

%.json: .PHONY #$(PROJ).json
	yosys -m ghdl -p 'ghdl  $(PROJ); synth_ice40 -top $(PROJ) -json $@'

%.asc: %.json
	nextpnr-ice40 --lp8k --package cm81 --pcf $(PIN_DEF) --asc $@ --json $^

clean:
	rm -f $(PROJ).json $(PROJ).asc $(PROJ).rpt $(PROJ).bin *.cf

.SECONDARY:
#.PHONY: all prog clean