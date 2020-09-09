PROJ_DIR=`pwd`
ELF2HEX_DIR=~/Projects/riscv/hsc_evaluator/tools/elf2hex

TESTS=" aha-mont64 \
			  crc32 \
			  cubic \
			  edn \
			  huffbench \
			 	matmult-int \
			  minver \
			  nbody \
			  nettle-aes \
			  nettle-sha256 \
			  nsichneu \
			  picojpeg \
        qrduino \
        sglib-combined \
        slre \
        st \
        statemate \
        ud \
        wikisort"


rm -rf hex list bd
mkdir -p hex
mkdir -p list

./build_all.py --arch riscv32 --chip generic --board aubrac --cc riscv32-unknown-elf-gcc --cflags="-c -march=rv32im -mabi=ilp32 -O2 -ffunction-sections -fdata-sections" --ld riscv32-unknown-elf-gcc --ldflags="-Wl,-gc-sections,-T,${PROJ_DIR}/config/riscv32/boards/aubrac/script-riscv32.ld" --user-libs="-lm" --clean

for test in $TESTS; do
  python3 ${ELF2HEX_DIR}/elf2hex.py --input bd/src/$test/$test --output hex/$test.hex --wide 16
  riscv32-unknown-elf-objdump -D bd/src/$test/$test > list/$test.list
done
