# Hey Emacs, this is a -*- makefile -*-

# W5100 ethernet chip.

ifndef W5100_IP
W5100_IP="192,168,25,47"
endif
ifndef W5100_SUBNET
W5100_SUBNET="255,255,255,0"
endif
ifndef W5100_MULTICAST_IP
W5100_MULTICAST_IP="224,1,1,11"
endif
ifndef W5100_MULTICAST_PORT
W5100_MULTICAST_PORT="1234"
endif

ap.CFLAGS += -DDOWNLINK -DDOWNLINK_FBW_DEVICE=W5100 -DDOWNLINK_AP_DEVICE=W5100 -DUSE_SPI1
ap.CFLAGS += -DDOWNLINK_TRANSPORT=W5100Transport -DDATALINK=W5100
ap.CFLAGS += -DW5100_IP=$(W5100_IP) -DW5100_SUBNET=$(W5100_SUBNET) -DW5100_MULTICAST_IP=$(W5100_MULTICAST_IP) -DW5100_MULTICAST_PORT=$(W5100_MULTICAST_PORT)
ap.srcs += subsystems/datalink/downlink.c subsystems/datalink/w5100.c
ap.srcs += $(SRC_FIRMWARE)/datalink.c

