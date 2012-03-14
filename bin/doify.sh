#!/bin/bash
# scripted by Daniel Manjarres 9-24-2008
# useful for ECE411 students to not have to restart the simulator
# just to reload a program
# update 10-10-09 to support the alternative format used by the mp2.1 test code

if [ -z "$1" ]
then
	echo "Usage: $0 program.asm [memory path[,second_memory_path]] [compile path]"
	echo
	echo "will produce a modelsim 'do' file that loads the given program"
	echo "file into memory and initializes the simulator"
    echo "NOTE: LC3bAssembler must be in the same directory as $0 and"
    echo "you must run from that directory"
    echo 
    exit 1
fi

if [ ! -e "$1" ]
then
	echo file "$1" not found
	exit 2
fi

#this is an example of how setting up multiple DRAMS might look
#DEFAULT_MEMPATHS="/mp1_cpu/idram/vhdl_memory,/mp1_cpu/ddram/vhdl_memory"
DEFAULT_MEMPATHS="/cpu/dram/pdram/vhdl_memory"
DEFAULT_COMPILEPATH="../compile"

NAME=${1%\.*}			
MEMPATHS=${2:-$DEFAULT_MEMPATHS}
COMPILEPATH=${3:-$DEFAULT_COMPILEPATH}						

if [ ! -e LC3bAssembler ]
then
    echo "$0: LC3bAssembler not found"
    exit 2
fi

rm -f "$NAME.vhd"
$HOME/ece411/bin/LC3bAssembler "$1" -v
cat "$NAME.vhd" &> /dev/null &&
(
(
cat << EOF
echo "--- Executing initialization force file for $1 ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading $1 program code."
run 5
EOF

for MEMPATH in $(echo "$MEMPATHS" | tr "," " ")
do
	#must also handle the syntax
	#mem(288) := X"C0";
	cat "$NAME".vhd | tr -d " " | (while read a; do echo "change ${MEMPATH}/"${a}; done) |
			sed -e s/":=To_stdlogicvector("/" "/g |
			sed -e s/:=/" "/g |
			sed -e s/");"//g
done

cat << EOF
run 5
echo "Done loading $1 program code."
EOF

) > "$NAME".do
rm -f "$NAME".vhd
if [ -d $COMPILEPATH ]
then
	echo "Copying $NAME.do to $COMPILEPATH."
	cp "$NAME".do $COMPILEPATH
else
	echo "Copy failed. $COMPILEPATH does not exist. You must manually copy $NAME.do to a valid compile directory."
fi
)
