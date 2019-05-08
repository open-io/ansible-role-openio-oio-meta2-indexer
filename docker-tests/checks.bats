#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Volumes list' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds/TRAVIS/oio-meta2-indexer-0/oio-meta2-indexer-0.conf"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ '/mnt/foo/TRAVIS/meta2-0,/mnt/bar/TRAVIS/meta2-1' ]]
}
