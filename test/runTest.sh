cd ..

if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null ; then
    echo "already running on 8000"
else
    python -m SimpleHTTPServer 8000 &
fi

testcafe chrome test/TestCafeStudio/localhost-8000/fixture.testcafe
