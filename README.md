# unraid-tailscale

 	🚨 	🚨  ARCHIVED 🚨 	🚨

> I recommend you use [dkaser/unraid-tailscale](https://github.com/dkaser/unraid-tailscale).  The plugin route works even if array is stopped, which is better for remote support.
>
> I initially made this repo to enable me to be in control of updating the docker image at my convenience versus waiting for others
>
> Please use the plugin as this is archived.

-----------

Docker build files for tailscale on unraid

![GitHub](https://img.shields.io/github/license/iancleary/unraid-tailscale)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/iancleary/unraid-tailscale)
![Docker Version](https://img.shields.io/docker/v/iancleary/unraid-tailscale)


This is intentended to provide access to the unraid server itself over tailscale and does not act as a VPN gateway.

It is possible to get this working using UP_FLAGS however as this was never the intention for this container I cannot provide
support for this usage.

## Instructions

First off, the use of my image relies  on the template for unraid community applications from <https://github.com/deasmi/unraid-tailscale>. I currently don't know how to make these templates.  

Simply change the image to:

`iancleary/unraid-tailscale:TAG` with a tag for matching the badge below.

If it were `X.Y.Z`, the image would be `iancleary/unraid-tailscale:X.Y.Z`.  See the badge below for the latest version.

![Docker Version](https://img.shields.io/docker/v/iancleary/unraid-tailscale)

----

> Note: I don't update this screenshot for releases.

![Unraid Docker Template Screenshot](images/Unraid_Template_deasmi_unraid-tailscale.png)

** IMPORTANT When you first start this container you must check the log file for the logon URL and then enter it into a browser and logon to tail scale. I would then also advise setting the keys to not expire for your unraid host **

![Unraid Docker Logs Screenshot](images/Unriad-Tailscale-Logs.png)

## Optional Env Vars

- `UP_FLAGS` &ndash; Pass flags to the `tailscale up` command run on start-up
Please note that support cannot be provided for the use of UP_FLAGS


## Workflow to build image

Github Actions are used to build the image, see [publish.yml](.github/workflows/publish.yml).

For the build logs, see this repo's [actions](https://github.com/iancleary/unraid-tailscale/actions).

## Authors

See [Authors.md](Authors.md) for LICENSE attributions.
