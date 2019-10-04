# Push to DigitalOcean
Pushing docker image to newly created Digital Ocean droplet

## Inputs

### `token`

**Required** Digital Ocean token (How to get it https://docs.docker.com/machine/examples/ocean/)

### `name`
Droplet name to be created

### `ports`
Exposed ports in 00:00 format

### `image`
Image name you created in previous steps

### `file`
File name you created in previous steps

## Outputs

### `ip`

Newly created droplet ip

## Example usage

```yaml
uses: iambeone/pushtodigitalocean@master
with:
  token: ${{ secrets.token }}
  ports: 4000:4000
  image: myimage
  file: myimage.tgz
  name: dropletnametobecreated
```
