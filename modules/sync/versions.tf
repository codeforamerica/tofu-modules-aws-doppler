terraform {
  required_version = ">= 1.9"

  required_providers {
    doppler = {
      source  = "dopplerhq/doppler"
      version = "~> 1.20"
    }
  }
}
