#!/bin/bash

APP_NAME="Greetings"
UNSIGNED_APP_NAME="${APP_NAME}_unsigned"
APP_INFO_PLIST_PATH="${APP_NAME}.app/Contents/Info.plist"
BUNDLE_ID=$(/usr/libexec/PlistBuddy -c 'print ":CFBundleIdentifier"' "${APP_INFO_PLIST_PATH}")
SCRIPTS="scripts"

function create_pkg {
    pkgbuild \
        --root "${APP_NAME}.app" \
        --install-location "/Applications/${APP_NAME}.app" \
        --identifier "${BUNDLE_ID}" \
        --scripts "${SCRIPTS}" \
        "${UNSIGNED_APP_NAME}.pkg"
}

function sign_pkg {
    productsign --sign "Developer ID Installer" "${UNSIGNED_APP_NAME}.pkg" "${APP_NAME}.pkg"
}

function main {
    create_pkg
    # sign_pkg
}

main