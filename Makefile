################################################################################
#                                                                              #
#                    This is the make file for this project                    #
#                                                                              #
#                    @author Jack <jack@thinkingcloud.info>                    #
#                                 @version 1.0                                 #
#                          @date 2021-05-31 13:53:48                           #
#                                                                              #
################################################################################

#==============================================================================#
#                                  Functions                                   #
#==============================================================================#


define detect
$(shell $(PWD)/scripts/detect.sh $1)
endef

define bump
	$(shell $(BUMPVERSION) --current-version $(VERSION) $1 setup.py __init__.py)
endef

#==============================================================================#
#                                  Variables                                   #
#==============================================================================#

PWD = $(shell pwd)
PYTHON := $(call detect, python)
PYTEST := $(call detect, pytest)
TWINE := $(call detect, twine)
VERSION := $(call detect, version)
SILENT := @
ECHO := echo
TESTS := tests
RM := rm -rf 
TEST_PYPI := https://test.pypi.org/legacy/
SRC := $(shell find configpy -type f) $(shell find version -type f)
BUMPVERSION=$(call detect, bumpversion)

#==============================================================================#
#                                    Tasks                                     #
#==============================================================================#

test:
	$(SILENT) $(PYTEST) $(TESTS) -s
.PHONY: test

run:
	$(SILENT) $(ECHO) $(PYTHON) $(PYTEST)
.PHONY: run

clean:
	$(SILENT) $(RM) build
	$(SILENT) $(RM) dist
.PHONY: clean

dist/configpy-$(VERSION).tar.gz: $(SRC)
	$(SILENT) $(RM) build
	$(SILENT) $(RM) configpy.egg-info/
	$(SILENT) $(RM) dist
	$(SILENT) $(PYTHON) setup.py sdist
.PHONY: build

test_upload: dist/configpy-$(VERSION).tar.gz
	$(SILENT) $(TWINE) upload --repository-url $(TEST_PYPI) dist/*
.PHONY: test_upload

#==============================================================================#
#                              Version Management                              #
#==============================================================================#

bump: bump_patch
.PHONY: bump

bump_patch:
	$(SILENT) $(call bump, patch)
.PHONY: bump_patch

bump_minor:
	$(SILENT) $(call bump, minor)

bump_major:
	$(SILENT) $(call bump, major)
