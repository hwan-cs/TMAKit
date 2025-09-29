.PHONY: generate clean regenerate
.ONESHELL:

SHELL := /bin/zsh

generate:
	tuist install
	tuist generate
	xed .

clean:
	tuist clean
	find . -name "*.xcodeproj" -type d -exec rm -rf {} +
	find . -name "*.xcworkspace" -type d -exec rm -rf {} +
	
regenerate: tuist clean
	tuist generate
	xed .

reset: clean generate
