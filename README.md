# unraid-tailscale

Docker build files for tailscale on unraid

![GitHub](https://img.shields.io/github/license/iancleary/unraid-tailscale)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/iancleary/unraid-tailscale)


This is intentended to provide access to the unraid server itself over tailscale and does not act as a VPN gateway.
It is possible to get this working using UP_FLAGS however as this was never the intention for this container I cannot provide
support for this usage.

## Optional Env Vars

- `UP_FLAGS` &ndash; Pass flags to the `tailscale up` command run on start-up
Please note that support cannot be provided for the use of UP_FLAGS


## Workflow to build image

### Production

> Update make.env with version of tailscale package

```bash
docker login -u iancleary
make build
make push
```

### Dev

TBD if required

## Authors

See [Authors.md](Authors.md) for LICENSE attributions.
