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
  __asm__ volatile ("li x29, 0x101010" : : : "memory");
  __asm__ volatile ("li x30, 0" : : : "memory");
  __asm__ volatile ("li x29, 0" : : : "memory");
  __asm__ volatile ("li x30, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
stop_trigger ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("csrrw x31, cycle, x0" : : : "memory");
  __asm__ volatile ("li x29, 0x101010" : : : "memory");
  __asm__ volatile ("li x30, 1" : : : "memory");
  __asm__ volatile ("li x29, 0" : : : "memory");
  __asm__ volatile ("li x30, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
verify_trigger (int correct)
{
  __asm__ volatile ("li x29, 0x101010" : : : "memory");
  __asm__ volatile ("li x30, 2" : : : "memory");
  __asm__ volatile ("li x29, 0" : : : "memory");
  __asm__ volatile ("li x30, 0" : : : "memory");
}
