#!/bin/bash
# This script is meant to be called by the "after_success" step defined in
# .travis.yml. See http://docs.travis-ci.com/ for more details.

# License: 3-clause BSD

set -e

if [[ "$COVERAGE" == true ]]; then

    # Need to run coveralls from a git checkout, so we copy .coverage
    # from TEST_DIR where pytests has been run
    pip install codecov
    cp $TEST_DIR/.coverage $TRAVIS_BUILD_DIR
    cp $TEST_DIR/coverage.xml $TRAVIS_BUILD_DIR

    codecov --root $TRAVIS_BUILD_DIR || echo "codecov upload failed"

fi
