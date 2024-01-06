start=0.1
end=1.0
step=0.1

current=$start

while (( $(echo "$current <= $end" | bc -l) )); do
    # Your code here, using $current as the non-integer value
    echo "Current value: $current"

    # Increment the current value by the step
    current=$(echo "$current + $step" | bc -l)
done