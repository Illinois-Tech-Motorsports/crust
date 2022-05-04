packer {
  required_plugins {
    arm-image = {
      version = ">= 0.2.5"
      source  = "github.com/solo-io/arm-image"
    }
  }
}

source "arm-image" "raspbian" {
  iso_url = "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/2022-04-04-raspios-bullseye-arm64-lite.img.xz"
  iso_checksum = "sha256:35f1d2f4105e01f4ca888ab4ced6912411e82a2539c53c9e4e6b795f25275a1f"
  target_image_size = 3*1024*1024*1024
}

build {
  sources = ["source.arm-image.raspbian"]

   provisioner "shell" {
    script = "./scripts/services.sh"
  }
}
