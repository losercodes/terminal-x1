#!/bin/bash

set -e  # Exit on errors

APP_NAME="terminal-x1"
VERSION="1.0.0"
ARCH="amd64"
DEB_DIR="deb-build/${APP_NAME}_${VERSION}"

# Create necessary directories
mkdir -p "${DEB_DIR}/DEBIAN"
mkdir -p "${DEB_DIR}/usr/local/bin"

# Create control file
cat <<EOF > "${DEB_DIR}/DEBIAN/control"
Package: ${APP_NAME}
Version: ${VERSION}
Architecture: ${ARCH}
Maintainer: Your Name <your.email@example.com>
Description: Terminal AI Assistant
EOF

# Copy executable files
cp terminal-x1.py "${DEB_DIR}/usr/local/bin/terminal-x1"
chmod +x "${DEB_DIR}/usr/local/bin/terminal-x1"

# Build the .deb package
dpkg-deb --build "${DEB_DIR}"
mv "deb-build/${APP_NAME}_${VERSION}.deb" .

