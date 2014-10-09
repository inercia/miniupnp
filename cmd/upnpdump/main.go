package main

import (
	"log"

	"github.com/inercia/miniupnp/upnp"
)

func main() {
	nat, err := upnp.Discover()
	if err != nil {
		log.Fatalf("Could not create discoverer: %v", err)
	}

	addr, errE := nat.GetExternalAddress()
	if errE != nil {
		log.Fatalf("Could not discover external IP: %v", errE)
	}

	log.Printf("External IP: %v", addr.String())
}
