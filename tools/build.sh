#!/usr/bin/env bash
# Update the README.md file
pod2markdown lib/Text/ASCII/Convert.pm >README.md
# Run the tests
prove -l t/*.t
# Build the distribution
perl Makefile.PL
make manifest
make
make dist
# Clean up
make clean
rm -f MANIFEST *.old *.bak
