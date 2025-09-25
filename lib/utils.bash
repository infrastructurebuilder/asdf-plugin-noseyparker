#!/usr/bin/env bash

set -euo pipefail

# This is the correct GitHub homepage where releases can be downloaded for noseyparker.
GH_REPO="https://github.com/praetorian-inc/noseyparker"
TOOL_NAME="noseyparker"
TOOL_TEST="noseyparker --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if noseyparker is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# TODO: Adapt this. By default we simply list the tag names from GitHub releases.
	# Change this function if noseyparker has other means of determining installable versions.
	list_github_tags
}

detect_system() {
    local os_type
		os_type=$(uname -s)

    case "$os_type" in
        "Darwin")
            echo "apple-darwin"
            ;;
        "Linux")
            # For Linux, check which C library is in use
            if ldd /bin/ls 2>/dev/null | grep -q 'musl'; then
                echo "unknown-linux-musl"
            else
                echo "unknown-linux-gnu"
            fi
            ;;
        *)
            # Handle other operating systems or print an unknown
            echo "unknown-os-or-type"
            ;;
    esac
}

download_release() {
	local version filename url archtype osid
	version="$1"
	filename="$2"
	archtype="$(uname -m)"
	osid="$(detect_system)"
	url="$GH_REPO/releases/download/v${version}/noseyparker-v${version}-${archtype}-${osid}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	echo "   from $url to $filename"
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	echo "* Installing $TOOL_NAME version $version... from $ASDF_DOWNLOAD_PATH to $install_path"
	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# TODO: Assert noseyparker executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"

		#test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."
		test -x "$install_path/$tool_cmd"

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
