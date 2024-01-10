read -p "Are you sure you want to continue? The content of all the results will be lost. (y/n): " answer

if [[ $answer =~ ^[Yy]$ ]]; then
    if [[ "$1" == "k" ]]; then
    echo -n > "results/only_K/Coverage.txt"
    echo -n > "results/only_K/CPU_time.txt"
    echo -n > "results/only_K/K_values.txt"
    echo "test"
    fi
    if [[ "$1" == "m" ]]; then
    echo -n > "results/both/Coverage.txt"
    echo -n > "results/both/CPU_time.txt"
    echo -n > "results/both/K_and_M.txt"
    fi
else
    echo "Script aborted."
    exit 1
fi