
# https://formulae.brew.sh/formula/crane
# install crane for this to work (brew install crane works on macOS)

# crane auth login ghcr.io -u <your_github_username> -p '<GITHUB_PAT>'

# Write the docker container you want to migrate in SRC_REF and the target repository on Github in the DEST_REF and run this



export SRC_REF=chromedp/headless-shell@sha256:8a59f11326194bd44e7ae86041e33aa22603291c329b02e0c8031c2d68574cc0
export DEST_REF=ghcr.io/shenato/docker-browser/chromedp-headless-shell:141.0.7390.37

crane cp ${SRC_REF} ${DEST_REF}


# Verifies if it worked
crane manifest ${DEST_REF} | jq '.manifests[].platform'


# should look something like this
# {
#   "architecture": "amd64",
#   "os": "linux"
# }
# {
#   "architecture": "arm64",
#   "os": "linux",
#   "variant": "v8"
# }
