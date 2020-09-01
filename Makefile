GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exception -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.0: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.0: %.s
	as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ @(objects)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin



































