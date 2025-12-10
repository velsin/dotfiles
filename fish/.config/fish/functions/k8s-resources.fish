function k8s-resources
    echo "--- NODES"
    kubectl top nodes
    echo -e "\n--- PODS (Top 10 CPU)"
    kubectl top pods --all-namespaces --sort-by=cpu | head -11
    echo -e "\n--- PODS (Top 10 Memory)"
    kubectl top pods --all-namespaces --sort-by=memory | head -11
end
