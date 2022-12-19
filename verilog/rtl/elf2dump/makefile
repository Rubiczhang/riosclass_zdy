# == Directories
ELF_DIR := ../elf
DUMP_DIR := .
SRC := $(wildcard $(ELF_DIR)/*)

# == Tools
OBJDUMP := riscv64-unknown-elf-objdump

default :
#	$(foreach var, $(SRC), \
#		echo $(patsubst $(ELF_DIR)/%, $(DUMP_DIR)/%.hex, $(var)) ; \
#	)
	$(foreach var, $(SRC), \
		$(OBJDUMP) -D $(var)  \
		> $(patsubst $(ELF_DIR)/%, $(DUMP_DIR)/%.dump, $(var)) ; \
	)