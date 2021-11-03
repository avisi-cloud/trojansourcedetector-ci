#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/haveyoudebuggedit/trojansourcedetector/tags?per_page=1" | # Get latest release from GitHub api
    grep '"name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}


version=$(get_latest_release "haveyoudebuggedit/trojansourcedetector")

echo $version
