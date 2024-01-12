read -p "Are you sure you want to continue? The content of all the results will be lost. (y/n): " answer

if [[ $answer =~ ^[Yy]$ ]]; then
    echo -n > "results/only_K/Coverage.txt"
    echo -n > "results/only_K/CPU_time.txt"
    echo -n > "results/only_K/K_values.txt"
    echo -n > "results/only_K/Test_application_time.txt"
else
    echo "Script aborted."
    exit 1
fi