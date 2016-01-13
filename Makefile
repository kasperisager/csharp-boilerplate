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

################################################################################
# Target configuration
#
# These settings should only be touched if you know exactly what you're doing.
################################################################################

# Compilers and runtimes.
DNX = dnx
DNU = dnu

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
	@for project in ${SRC}/*; do \
		${DNU} restore --quiet $$project; \
	done
	@for project in ${TEST}/*; do \
		${DNU} restore --quiet $$project; \
	done

# Build application and test specification assemblies for debugging.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
# `{src,test}/**/*` - Source and test files.
${BUILD}/Debug: ${PACKAGES} ${SRC}/**/* ${TEST}/**/*
	@for project in ${SRC}/*; do \
		${DNU} build --quiet --out ${BUILD} --configuration Debug $$project; \
	done
	@for project in ${TEST}/*; do \
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
build: ${BUILD}/Release

# Run applications using DNX.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
run: ${PACKAGES}
	@for project in ${SRC}/*; do \
		(cd $$project && ${DNX} --lib ${LIB} run); \
	done

# Run test specifications using DNX.
#
# Dependencies:
# `packages` - The installed NuGet packages for all DNX projects.
test: ${PACKAGES}
	@for project in ${TEST}/*; do \
		(cd $$project && ${DNX} --lib ${LIB} test); \
	done

# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build run test
