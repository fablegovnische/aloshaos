AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OC=arm-none-eabi-objcopy
MC=-mcpu=cortex-a8

all:file/aloshaos.bin

file/st.o:sursi/st.s
	mkdir -p file
	$(AS) $(MC) -o $@ $<

file/ds.o:sursi/ds.s
	mkdir -p file
	$(AS) $(MC) -o $@ $<

file/tx.o:sursi/tx.s
	mkdir -p file
	$(AS) $(MC) -o $@ $<

file/aloshaos.elf:file/st.o file/ds.o file/tx.o
	$(LD) -Ttext=0x70000000 -e st -o $@ $^

file/aloshaos.bin:file/aloshaos.elf
	$(OC) -O binary $< $@

run:file/aloshaos.elf
	qemu-system-arm -M realview-pb-a8 -display gtk,show-menubar=off -kernel $<

term:file/aloshaos.elf
	qemu-system-arm -M realview-pb-a8 -nographic -kernel $<

clean:
	rm -f file/*
