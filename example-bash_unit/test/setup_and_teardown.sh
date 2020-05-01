source "${TEST}/util/customasserts.sh"

# Create test data directories
function setup_suite() {
  mkdir -p ${BUILD}/testdata
}

# Remove test data directories
function teardown_suite() {
  rm -rf ${BUILD}/testdata
}

# Generate fresh example files for the tests
function setup() {
  rm -rf ${BUILD}/testdata/*

  for i in {1..3}
  do
    echo "Hello $i" > "${BUILD}/testdata/${i}.txt"
  done
}

# Assert that the tests did not remove the example files
function teardown() {
  result=$(ls ${BUILD}/testdata -1)
  assert_equals 0 $? # assert success

  assert_contains "1.txt" "${result}"
  assert_contains "2.txt" "${result}"
  assert_contains "3.txt" "${result}"
}

function test_number-of-files_should_return_the_number_of_files_in_the_directory() {
  result=$(${SRC}/file-report.sh number-of-files ${BUILD}/testdata)
  assert_equals 0 $?
  assert_equals 3 "${result}"
}

function test_size_should_return_the_total_size_of_the_files_in_the_directory() {
  result=$(${SRC}/file-report.sh size ${BUILD}/testdata)
  assert_equals 0 $?
  assert_equals "16K" "${result}"
}

