<div align="center">

# crust

<p>
  <b>A customized linux image for a raspberry-pi driven dashboard.</b>
  <br/>
  <a href="https://github.com/Illinois-Tech-Motorsports/dashy"><strong>View the Dashboard »</strong></a>
  <br/><br/>
</p>

[![](https://img.shields.io/github/license/illinois-tech-motorsports/crust)](https://github.com/illinois-tech-motorsports/crust/blob/main/LICENSE)
</div>

## Download
The built image file can be found in `Artifacts` under the latest [builds](https://github.com/Illinois-Tech-Motorsports/crust/actions). Write the image to the SD card using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or equivelent software. 

## Scripts
The packer build includes a set of scripts which each execute a set of instructions to alter the finished build file. The scripts are described as follows:

- [**services.sh**](https://github.com/Illinois-Tech-Motorsports/crust/blob/main/scripts/services.sh) - Disables unneccessary services.

## License

Distributed under the GNU General Public License v3. See `LICENSE`
