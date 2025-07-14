

*** Settings ***
Library           Process
Library           OperatingSystem

*** Test Cases ***
Print Just A Log
    Log    This is a simple log message.

*** Test Cases ***
Run C++ Executable And Check Output
    ${result}=    Run Process    ./build_dir/test_project    shell=True    stdout=./build_dir/stdout.txt
    ${output}=    Get File    ./build_dir/stdout.txt
    Should Contain    ${output}    Test8
