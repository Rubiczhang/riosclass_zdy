# == Directories
ELF_DIR := ../elf
HEX_DIR := .
SRC := $(wildcard $(ELF_DIR)/*)

# == Tools
ELF2HEX := elf2hex

# == elf parameter
HEX_WIDTH := 4 	#bytes
HEX_DEPTH := 2048
HEX_BASE  := 2147483648
# ==

default :
#	$(foreach var, $(SRC), \
#		echo $(patsubst $(ELF_DIR)/%, $(HEX_DIR)/%.hex, $(var)) ; \
#	)
	$(foreach var, $(SRC), \
		$(ELF2HEX) $(HEX_WIDTH) $(HEX_DEPTH) $(var) $(HEX_BASE) \
		> $(patsubst $(ELF_DIR)/%, $(HEX_DIR)/%.hex, $(var)) ; \
	)