#!/usr/bin/bash

# Requires wget, xz

# Get the actual version of LXQt used by latest Lubuntu from e.g.:
# https://cdimage.ubuntu.com/lubuntu/releases/25.10/snapshot-4/lubuntu-25.10-snapshot4-desktop-amd64.manifest?utm_source=chatgpt.com

# Upstream dependencies
#
UPSTREAM_URL_BASE="http://archive.ubuntu.com/ubuntu/pool/universe/l/lubuntu-artwork"
UPSTREAM_URL_TEMPLATE='$UPSTREAM_URL_BASE/lubuntu-artwork_$R_DOT_V.tar.xz' # lazy evaluated, triggers SC2016
THEME_FILE="Lubuntu Arc"

# Script dependencies
#
WORK_DIR="tijdelijk"
LEXT_ARCHIVE="lext-theme-lubuntu-arc"
SCRIPT_DIR="maintainer-scripts"

EXIT_EMOJI="❌"
FAIL_EMOJI="⚡"
#HELP_EMOJI="💡" # 🆘
HINT_EMOJI="👉"
INFO_EMOJI="ℹ️"
OK_EMOJI="✅"
WARNING_EMOJI="⚠️ "
QUESTION_EMOJI="❓"

# Start of functions

function fail() {
	echo "$FAIL_EMOJI $*" # $@

	cleanup-temporary-directory

	echo "$EXIT_EMOJI Exiting."
	exit
}

function warn() {
	echo "$WARNING_EMOJI $*"
}

function hint() {
	echo "$HINT_EMOJI $*"
}

function notice() {
	echo "$INFO_EMOJI  $*"
}

function ok() {
	echo "$OK_EMOJI  $*"
}

function ctrl-c() {
	echo ""
	fail "You have interrupted the script."
}

trap ctrl-c INT

function non-root() {
	if [ "$EUID" -eq 0 ]; then

		fail "Do not run this script as root."
	fi
}

function warning() {
	echo ""
	echo "******************************************************************************"
	echo "*** This script is used by the maintainer of this repository.              ***"
	echo "******************************************************************************"
	echo "*** You could use it to generate and manually install a different variant  ***"
	echo "*** of the '$THEME_FILE' theme (without the AUR helper), if you know how   ***"
	echo "*** AUR works. That you would need such a thing is highly unlikely though. ***"
	echo "******************************************************************************"
	read -r -e -i "$QUESTION_EMOJI Press <ctlr+c> to stop or just <enter> to continue: "
}

function check_working_directory() {
	RUNNING_DIR="$(basename "$(pwd -P)")"

	if [ "$RUNNING_DIR" != "$SCRIPT_DIR" ]; then

		# not totally fail safe but good enough
		fail "This script must be run from the '$SCRIPT_DIR' directory."
	fi
}

function prepare-temporary-directory() {
	rm -Rf $WORK_DIR

	if ! mkdir $WORK_DIR; then

		fail "Error while creating subdirectory '$WORK_DIR'."
	fi
}

function ask-release-and-check-for-theme-availability() {
	TRIES=0
	echo ""

	while true; do

		((TRIES = TRIES + 1))

		read -r -e -i "25.10.2" -p "$QUESTION_EMOJI Give the Lubuntu release number and version number of the archive, e.g.: " R_DOT_V

		eval UPSTREAM_URL=${UPSTREAM_URL_TEMPLATE}

		if ! wget --spider --quiet "$UPSTREAM_URL"; then

			warn "No file exists in upstream archive for requested version '$R_DOT_V'."
			echo ""

			if ((TRIES > 1)); then
				notice "Check for available theme files 'lubuntu_artwork_YY.MM.V.tar.xz' at:"
				notice "	'$UPSTREAM_URL_BASE'"

				echo ""
				fail "Please retry."
			fi
		else
			break
		fi
	done
}

function download-requested-debian-package-from-upstream() {
	echo ""
	notice "Downloading upstream archive '$UPSTREAM_URL'. Be patient..."

	wget --no-clobber -O "$WORK_DIR/upstream.tar.xz" "$UPSTREAM_URL" 1>/dev/null 2>&1

	WGET_RESULT=$?

	if [ $WGET_RESULT -ne 0 ]; then

		fail "The requested URL '$UPSTREAM_URL' could not be dwownloaded."
	fi
}

function unpack-theme-from-upstream-into-temporary-directory() {
	tar -xf "$WORK_DIR/upstream.tar.xz" -C $WORK_DIR
	TAR_RESULT=$?

	if [ $TAR_RESULT -ne 0 ]; then

		fail "Some error while extracting file '$WORK_DIR/upstream.tar.xz'."
	fi
}

function copy-theme-from-upstream-to-lext-directory() {
	mkdir -p $WORK_DIR/lext/usr/share/lxqt/themes

	cp -r "$WORK_DIR/artwork/src/usr/share/lxqt/themes/Lubuntu Arc" "$WORK_DIR"/lext/usr/share/lxqt/themes

	COPY_RESULT=$?
	if [ $COPY_RESULT -ne 0 ]; then

		fail "Some error while copying theme files from archive in '$WORK_DIR/artwork' to new location '$WORK_DIR/lext'."
	fi
}

function pack-lext-directory-to-root() {
	tar -cJf ../"$LEXT_ARCHIVE".tar.xz -C "$WORK_DIR"/lext usr

	TAR_RESULT=$?
	if [ $TAR_RESULT -ne 0 ]; then

		fail "Some error while preparing file '$LEXT_ARCHIVE.tar.xz' from '$WORK_DIR/lext'."
	fi
}

function cleanup-temporary-directory() {
	rm -Rf $WORK_DIR
}

function further-instructions() {
	echo ""
	notice "A new file '$LEXT_ARCHIVE.tar.xz' has been generated (the file picked up by the AUR package)."

	echo ""
	hint "If you are the maintainer of this script, don't forget to commit, push and yay!"
}

function main() {
	non-root
	warning
	check_working_directory
	prepare-temporary-directory
	ask-release-and-check-for-theme-availability
	download-requested-debian-package-from-upstream
	unpack-theme-from-upstream-into-temporary-directory
	copy-theme-from-upstream-to-lext-directory
	pack-lext-directory-to-root
	cleanup-temporary-directory
	further-instructions
}

# Script starts here

main

# Script ends here
