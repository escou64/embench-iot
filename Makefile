
PROJ_DIR=`pwd`
ELF2HEX_DIR=~/Projects/riscv/hsc_evaluator/tools/elf2hex

build:
	./build_all.py --arch riscv32 --chip generic --board aubrac --cc riscv32-unknown-elf-gcc --cflags="-c -march=rv32im -mabi=ilp32 -O2 -ffunction-sections -fdata-sections" --ld riscv32-unknown-elf-gcc --ldflags="-Wl,-gc-sections,-T,${PROJ_DIR}/config/riscv32/boards/aubrac/script-riscv32.ld" --user-libs="-lm" --clean

hex:
	mkdir -p hex
	python3 ${ELF2HEX_DIR}/elf2hex.py --input bd/src/aha-mont64/aha-mont64 --output hex/aha-mont64.hex --wide 16
	python3 ${ELF2HEX_DIR}/elf2hex.py --input bd/src/crc32/crc32 --output hex/crc32.hex --wide 16
	python3 ${ELF2HEX_DIR}/elf2hex.py --input bd/src/nettle-aes/nettle-aes --output hex/nettle-aes.hex --wide 16

list:
	mkdir -p list
	riscv32-unknown-elf-objdump -D bd/src/aha-mont64/aha-mont64 > list/aha-mont64.list
	riscv32-unknown-elf-objdump -D bd/src/crc32/crc32 > list/crc32.list
	riscv32-unknown-elf-objdump -D bd/src/nettle-aes/nettle-aes > list/nettle-aes.list

cp:
	cp hex/* ~/cowlibry/hsc-eval/src/test/resources/hex/embench/

clean:
	rm -rf bd
	rm -rf hex
	rm -rf list
