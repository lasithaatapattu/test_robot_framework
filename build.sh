CURRENT_DIR=$(pwd)
[-d build_dir] && rm -r build_dir
mkdir build_dir
cd build_dir
cmake ..
make

EXECUTABLE="$CURRENT_DIR/build_dir/test_project"
TEST_FILE="$CURRENT_DIR/robot_test/test_add.robot"
cd $CURRENT_DIR

# Make sure the executable exists
if [ ! -f "$EXECUTABLE" ]; then
    echo "Executable not found at $EXECUTABLE"
    exit 1
fi

# Run the executable (if needed before the test)
"$EXECUTABLE"

# Run the Robot Framework test
robot --outputdir roboresults/  "$TEST_FILE"

