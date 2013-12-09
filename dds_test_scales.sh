#!/bin/sh

# find the DAC
for i in $(find /sys -name name 2>/dev/null)
do
  if [ "`cat $i`" = "cf-ad9122-core-lpc" ] ; then
     dac_path=$(echo $i | sed 's:/name$::')
     s1=out_altvoltage0_1A_scale
     s2=out_altvoltage1_1B_scale
     s3=out_altvoltage2_2A_scale
     s4=out_altvoltage3_2B_scale
     break
  fi
  if [ "`cat $i`" = "cf-ad9361-dds-core-lpc" ] ; then
     dac_path=$(echo $i | sed 's:/name$::')
     s1=out_altvoltage0_TX1_I_F1_scale
     s2=out_altvoltage1_TX1_I_F2_scale
     s3=out_altvoltage2_TX1_Q_F1_scale
     s4=out_altvoltage3_TX1_Q_F2_scale
     s5=out_altvoltage4_TX2_I_F1_scale
     s6=out_altvoltage5_TX2_I_F2_scale
     s7=out_altvoltage6_TX2_Q_F1_scale
     s8=out_altvoltage7_TX2_Q_F2_scale
  fi
done

for mag in 1.000000 0.500000 0.250000 0.125000 0.062500 0.031250 0.015625 0.007812 0.003906 0.001953 0.000976 0.000488 0.000244 0.000122 0.000061 0.000030;
do
  if [ ! -z $s1 ] ; then echo $mag > $dac_path/$s1 ; fi
  if [ ! -z $s2 ] ; then echo $mag > $dac_path/$s2 ; fi
  if [ ! -z $s3 ] ; then echo $mag > $dac_path/$s3 ; fi
  if [ ! -z $s4 ] ; then echo $mag > $dac_path/$s4 ; fi
  if [ ! -z $s5 ] ; then echo $mag > $dac_path/$s5 ; fi
  if [ ! -z $s6 ] ; then echo $mag > $dac_path/$s6 ; fi
  if [ ! -z $s7 ] ; then echo $mag > $dac_path/$s7 ; fi
  if [ ! -z $s8 ] ; then echo $mag > $dac_path/$s8 ; fi
  echo $mag
  sleep 1
done

mag=0.250000
if [ ! -z $s1 ] ; then echo $mag > $dac_path/$s1 ; fi
if [ ! -z $s2 ] ; then echo $mag > $dac_path/$s2 ; fi
if [ ! -z $s3 ] ; then echo $mag > $dac_path/$s3 ; fi
if [ ! -z $s4 ] ; then echo $mag > $dac_path/$s4 ; fi
if [ ! -z $s5 ] ; then echo $mag > $dac_path/$s5 ; fi
if [ ! -z $s6 ] ; then echo $mag > $dac_path/$s6 ; fi
if [ ! -z $s7 ] ; then echo $mag > $dac_path/$s7 ; fi
if [ ! -z $s8 ] ; then echo $mag > $dac_path/$s8 ; fi
