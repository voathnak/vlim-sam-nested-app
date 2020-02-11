#!/usr/bin/env bash

source scripts/config.sh

sam build && \
sam local start-api --region "$REGION" --profile "$PROFILE"
