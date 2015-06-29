################################################################################
# Project configuration
#
# Adjust these settings to fit your own project.
################################################################################

# Paths.
SRC = src
TEST = test
BUILD = build
PACKAGES = packages
LIB = lib
DOCS = docs
CONFIG = config

################################################################################
# Target configuration
#
# These settings should only be touched if you know exactly what you're doing.
################################################################################

# Compilers and runtimes.
DNX = dnx
DNU = dnu

# Framework targets. These must match the frameworks defined in your project
# files.
FRAMEWORKS = dnx451

# Gendarme configuration.
GENDARME = ${DNX} ${PACKAGES}/Mono.Gendarme/*/tools/gendarme.exe
GENDARME_CONFIG = ${CONFIG}/Gendarme.xml

# Doxygen configuration.
DOXYGEN = doxygen
DOXYGEN_CONFIG = ${CONFIG}/Doxyfile

################################################################################
# Targets
#
# These targets should only be touched if you know exactly what you're doing.
################################################################################

# https://www.gnu.org/software/make/manual/html_node/Special-Variables.html
.DEFAULT_GOAL = build

# Install required NuGet packages.
#
# Dependencies:
# `global.json` - The global DNX configuration file.
# `{src,test}/**/project.json` - The individual DNX project manifests.
${PACKAGES}: global.json ${SRC}/*/project.json ${TEST}/*/project.json
	@for project in {${SRC},${TEST}}/*; do \
		${DNU} restore --quiet $$project; \
	done

# Build application and test specification assemblies for debugging.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
# `{src,test}/**/*` - Source and test files.
${BUILD}/Debug: ${PACKAGES} ${SRC}/**/* ${TEST}/**/*
	@for project in {${SRC},${TEST}}/*; do \
		${DNU} build --quiet --out ${BUILD} --configuration Debug $$project; \
	done

# Build application assemblies for release.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
# `src/**/*` - Source files.
${BUILD}/Release: ${PACKAGES} ${SRC}/**/*
	@for project in ${SRC}/*; do \
		${DNU} pack --quiet --out ${BUILD} --configuration Release $$project; \
	done

# Alias for building application assemblies for release.
build: build/Release

# Generate API documentation using Doxygen.
#
# Dependencies:
# `src/**/*` - Source files.
# `config/Doxyfile` - The Doxygen configuration file.
${DOCS}: ${SRC}/**/* ${DOXYGEN_CONFIG}
	@${DOXYGEN} ${DOXYGEN_CONFIG}

# Run applications using DNX.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
run: ${PACKAGES}
	@${DNX} --lib ${LIB} ${SRC}/* run

# Run test specifications using DNX.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
test: ${PACKAGES}
	@${DNX} --lib ${LIB} ${TEST}/* test

# Run static code analysis on built assemblies using Gendarme.
#
# Dependencies:
# `build/Debug` - Built application and test specification assemblies.
check: ${BUILD}/Debug
	@${GENDARME} ${BUILD}/Debug/${FRAMEWORKS}/*.dll --config ${GENDARME_CONFIG}

# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build run test check
