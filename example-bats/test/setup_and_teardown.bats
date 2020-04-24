load '../lib/bats-support/load'
load '../lib/bats-assert/load'

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
  run ls build/testdata -1
  assert_success
  assert_output --partial "1.txt"
  assert_output --partial "2.txt"
  assert_output --partial "3.txt"
}

@test "number-of-files should return the number of files in the directory" {
  run src/file-report.sh number-of-files build/testdata
  assert_success
  assert_output "3"
}

@test "size should return the total size of the files in the directory" {
  run src/file-report.sh size build/testdata
  assert_success
  assert_output "16K"
}

