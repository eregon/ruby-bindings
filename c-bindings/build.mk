VERSION = v4.0.3+ruby-3.1.1

C_BINDINGS_BASE_URL = https://github.com/lib-ruby-parser/c-bindings/releases/download/$(VERSION)

c-bindings/libruby_parser_c-$(TARGET).$(DYLIB): c-bindings/libruby_parser_c-$(TARGET).$(A)
	cd c-bindings && ar -x libruby_parser_c-$(TARGET).$(A) && cd ..
	gcc -shared -o $@ c-bindings/*.o

c-bindings/libruby_parser_c-$(TARGET).$(A):
	$(call download_file, $(C_BINDINGS_BASE_URL)/libruby_parser_c-$(TARGET).$(A), $@)

c-bindings/lib-ruby-parser.h:
	$(call download_file, $(C_BINDINGS_BASE_URL)/lib-ruby-parser.h, $@)

c-bindings/clean:
	rm -f c-bindings/*.a
	rm -f c-bindings/*.lib
	rm -f c-bindings/lib-ruby-parser.h
