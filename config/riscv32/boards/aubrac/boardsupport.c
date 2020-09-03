/* Copyright (C) 2017 Embecosm Limited and University of Bristol

   Contributor Graham Markall <graham.markall@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

#include <support.h>

void
initialise_board ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
start_trigger ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("csrrw x31, cycle, x0" : : : "memory");
  __asm__ volatile ("addi x30, x0, 1010" : : : "memory");
  __asm__ volatile ("addi x29, x0, 101" : : : "memory");
  __asm__ volatile ("addi x30, x0, 0" : : : "memory");
  __asm__ volatile ("addi x29, x0, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
stop_trigger ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("csrrw x31, cycle, x0" : : : "memory");
  __asm__ volatile ("addi x30, x0, 1010" : : : "memory");
  __asm__ volatile ("addi x29, x0, 101" : : : "memory");
  __asm__ volatile ("addi x30, x0, 0" : : : "memory");
  __asm__ volatile ("addi x29, x0, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
verify_trigger ()
{
  __asm__ volatile ("addi x30, x0, 1010" : : : "memory");
  __asm__ volatile ("addi x29, x0, 101" : : : "memory");
  __asm__ volatile ("addi x30, x0, 0" : : : "memory");
  __asm__ volatile ("addi x29, x0, 0" : : : "memory");
}
