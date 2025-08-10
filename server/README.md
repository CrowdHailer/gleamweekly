# weekly

## Development with podman

Build an image.
```
podman build . --tag weekly
```
Dockerfile copied from https://lpil.uk/blog/deploying-gleam-on-fly-io/

Run the image
```
podman run -it -p 8080:8080 localhost/weekly
```

## Deploy with fly.io

Fly doesn't have a local development option on their CLI

install fly cli
```
curl -L https://fly.io/install.sh | sh
```


## TODO

- Local development, ideally using the same dockerfile
- Deployment, I'm ok with Fly
- pull in MCP code
- serve static files
- Deploy mcp server on fly https://fly.io/docs/blueprints/remote-mcp-servers/

If mailer is  the dev env if can depend on server

Option 1 a server application that starts with content.gleam
Option 1.a at boot time it generates the pages it needs
Option 2 keep the static generation to priv, note mailer or the build app doesn't need and of the package.json dependendencies as it doesn't use those midas effects.
Option 3 basically option 1 but use mailer as a dependency
Option 4 set up a routing rule in netlify to redirect mcp to a backend


- separate dev (running with fast reloading from preview running in docker)


The nodejs space is nicer, but I need to not be stuck in it.
This is probably where nix comes in.