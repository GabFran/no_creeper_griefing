.PHONY: all

datapack_files := $(shell find datapack/)

all: no_mob_griefing.zip

no_mob_griefing.zip: $(datapack_files)
	cd datapack && zip -r ../$@ *
