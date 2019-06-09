#!/usr/bin/env bash

REPO=${1}
MIRROR_DIR="/mirror"
SRC_URL="https://api.github.com/repos/${REPO}/releases"
DEST="${MIRROR_DIR}/${REPO}"

RELEASES=$(curl ${SRC_URL} | jq '[.[] | {tag_name: .tag_name, draft: .draft, assets: [.assets[].browser_download_url]}]')

for RELEASE in $(echo ${RELEASES} | jq -r '.[] | @base64'); do
  DRAFT=$(echo ${RELEASE} | base64 --decode | jq -r '.draft')
  NAME=$(echo ${RELEASE} | base64 --decode | jq -r '.tag_name')
  URLS=$(echo ${RELEASE} | base64 --decode | jq -r '.assets | .[]')

  if [[ "${DRAFT}" != "false" ]]; then
    continue
  fi

  RELEASE_DEST=${DEST}/${NAME}
  if [[ -d ${RELEASE_DEST} ]]; then
    continue
  fi

  mkdir -p ${RELEASE_DEST}
  wget -P ${RELEASE_DEST} --no-verbose ${URLS}

done
