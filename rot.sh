#!/bin/bash

# Check if the user has provided input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"ciphertext\""
    exit 1
fi

# The ciphertext to decrypt
ciphertext="$1"

# Function to perform a ROT-N decryption
rot_n() {
    local text="$1"
    local shift="$2"
    local upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local lower="abcdefghijklmnopqrstuvwxyz"
    local rotated_upper="${upper:$shift}${upper:0:$shift}"
    local rotated_lower="${lower:$shift}${lower:0:$shift}"
    echo "$text" | tr "$upper$lower" "$rotated_upper$rotated_lower"
}

# Loop through ROT1 to ROT26
for ((i=1; i<=26; i++)); do
    decrypted_text=$(rot_n "$ciphertext" $i)
    echo "ROT$i: $decrypted_text"
done
