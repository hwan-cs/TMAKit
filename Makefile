.PHONY: generate clean regenerate
.ONESHELL:

SHELL := /bin/zsh

generate:
	tuist install
	tuist generate
	xed .

clean:
	tuist clean
	rm -rf **/*.xcodeproj **/*.xcworkspace
	
regenerate:
	tuist clean
	find . -name "*.xcodeproj" -type d -exec rm -rf {} +
	find . -name "*.xcworkspace" -type d -exec rm -rf {} +
	tuist generate
	xed .
