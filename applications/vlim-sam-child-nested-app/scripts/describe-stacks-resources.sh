#!/usr/bin/env bash

source scripts/config.sh
aws cloudformation describe-stack-resources \
					--profile "$PROFILE" \
					--region "$REGION" \
					--stack-name "$STACK_NAME"