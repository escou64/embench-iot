# Aubrac - Embench

Command line:
```
$ ./build_all.py --arch riscv32 --chip generic --board aubrac --cc riscv32-unknown-elf-gcc --ld riscv32-unknown-elf-ld --cflags="-c -march=rv32im -mabi=ilp32 -O2 -ffunction-sections -fdata-sections" --ldflags="-Wl,-gc-sections,-T,/home/escou64/Projects/test/embench-iot/script.ld" --user-libs="-lm" --clean
```

```
./build_all.py --arch riscv32 --chip generic --board aubrac --cc riscv32-unknown-elf-gcc --cflags="-c -march=rv32im -mabi=ilp32 -O2 -ffunction-sections -fdata-sections" --ld riscv32-unknown-elf-gcc --ldflags="-Wl,-gc-sections,-T,/home/escou64/Projects/riscv/embench-iot/script-riscv32.ld,-Ttext-segment,0x1000" --user-libs="-lm" --clean
```

```
  python3 ~/Projects/riscv/hsc_evaluator/tools/elf2hex/elf2hex.py --input bd/src/aha-mont64/aha-mont64 --output hex/aha-mont64.hex --wide 16
```

[Help link](https://github.com/embench/embench-iot/issues/2)
