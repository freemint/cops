UDO ?= udo
HCP ?= hcp

LANGUAGES = en de fr

IMAGES = cops.img

ALL_HYPS = $(addprefix cops_, $(addsuffix .hyp, $(LANGUAGES)))

all: $(ALL_HYPS)

%.stg: %.u
	@if command -v $(UDO) >/dev/null 2>&1; then \
		$(UDO) --stg -o $@ $<; \
	else \
		echo "UDO not found, help file not compiled" >&2; \
	fi

%.hyp: %.stg
	@if command -v $(HCP) >/dev/null 2>&1 && test -f $<; then \
		$(HCP) -o $@ $<; \
	else \
		echo "HCP not found, help file not compiled" >&2; \
	fi

$(ALL_HYPS): $(IMAGES)

clean::
	$(RM) *.hyp *.ref *.stg *.uls *.uhs
