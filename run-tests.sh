echo "Clean previous artifacts"

rm -rf test-results/
rm -f *.log
rm -rf dist/


#Angular
if [ -f "package.json" ]; then
    echo "Angular project"

    echo "Run tests"
    npm test
    status=$?

    if [ $status -ne 0 ]; then
        echo "Tests failed"
        exit 1
    fi

    echo "Tests successfully"
    echo "Report in test-results"
    exit 0
fi

echo "Nothing Angular project"
exit 1
