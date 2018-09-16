#!/bin/sh

template=$1/scripts/SecretsTemplate.swift
secrets=$1/Tests/ElsevierKitTests/Secrets.swift
cp $template $secrets
sed -i 's/SCOPUS_API_KAY/'$2'/g' $secrets
