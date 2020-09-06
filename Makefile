

build:
	./build_all.py --arch riscv32 --chip generic --board aubrac --cc riscv32-unknown-elf-gcc --cflags="-c -march=rv32im -mabi=ilp32 -O2 -ffunction-sections -fdata-sections" --ld riscv32-unknown-elf-gcc --ldflags="-Wl,-gc-sections,-T,/home/escou64/Projects/riscv/embench-iot/script-riscv32.ld,-Ttext-segment,0x1000" --user-libs="-lm" --clean

hex:
	mkdir -p hex
	python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/aha-mont64/aha-mont64 --output hex/aha-mont64.hex --wide 16
	python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/crc32/crc32 --output hex/crc32.hex --wide 16
	python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/cubic/cubic --output hex/cubic.hex --wide 16
	python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/nettle-aes/nettle-aes --output hex/nettle-aes.hex --wide 16
	python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/nettle-sha256/nettle-sha256 --output hex/nettle-sha256.hex --wide 16

list:
	mkdir -p list
	riscv32-unknown-elf-objdump -D bd/src/aha-mont64/aha-mont64 > list/aha-mont64.list
	riscv32-unknown-elf-objdump -D bd/src/crc32/crc32 > list/crc32.list
	riscv32-unknown-elf-objdump -D bd/src/cubic/cubic > list/cubic.list
	riscv32-unknown-elf-objdump -D bd/src/nettle-aes/nettle-aes > list/nettle-aes.list
	riscv32-unknown-elf-objdump -D bd/src/nettle-sha256/nettle-sha256 > list/nettle-sha256.list

cp:
	cp hex/* ~/cowlibry/hsc-eval/src/test/resources/hex/embench/

clean:
	rm -rf bd
	rm -rf hex
	rm -rf list
