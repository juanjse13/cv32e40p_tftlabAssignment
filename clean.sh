read -p "Are you sure you want to continue? The content of all the results will be lost. (y/n): " answer

if [[ $answer =~ ^[Yy]$ ]]; then
    echo -n > "results/Coverage.txt"
    echo -n > "results/CPU_time.txt"
    echo -n > "results/K_values.txt"
else
    echo "Script aborted."
    exit 1
fi