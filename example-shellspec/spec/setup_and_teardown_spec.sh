# Create test data directories
function setup_suite() {
  mkdir -p build/testdata
}
setup_suite

Describe 'file-report.sh'
  # Generate fresh example files for the tests
  setup() {
    rm -rf build/testdata
    mkdir -p build/testdata

    for i in {1..3}
    do
      echo "Hello $i" > "build/testdata/${i}.txt"
    done
  }

  # Assert that the tests did not remove the example files
  teardown() {
    local result
    result=$(ls build/testdata -1)
    [[ 0 -eq $? ]] # assert success
    [[ "${result}" == *"1.txt"* ]]
    [[ "${result}" == *"2.txt"* ]]
    [[ "${result}" == *"3.txt"* ]]
  }

  Before 'setup'
  After 'teardown'

  It 'should return the number of files in the directory'
    When call src/file-report.sh number-of-files build/testdata
    The status should be success
    The output should equal '3'
  End

  It 'should return the total size of the files in the directory'
    When call src/file-report.sh size build/testdata
    The status should be success
    The output should equal '16K'
  End
End

# Remove test data directories
function teardown_suite() {
  rm -rf build/testdata
}
teardown_suite

