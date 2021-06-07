# Welcome To The Fluence DevContainer

DevContiner is a ready to use development environment with VSCode integration containing the following tools:

- `aqua-cli` to compile Aqua to AIR & Typescript
- `fldist` to manage services and execute AIR scripts
- `marine` & `mrepl` to compile Rust to WASM & run it locally

## How to install

Installation requirements are the availability of Docker and VSCode on your system. If you need Docker,
please follow the [Get Docker](https://docs.docker.com/get-docker/) instructions for your OS. For VSCode, please see [VSCocde](https://code.visualstudio.com/) for instructions.

With Docker and VSCode in place:

1. Install Remote-Containers extension in VSCode
2. Run Remote-Containers: Clone Repository in Container Volume... through command palette (F1 or Cmd-Shift-P)
3. Enter `fluencelabs/devcontainer`
4. When asked for branch, press enter (main)
5. When asked for volume, press enter (unique)
6. open Terminal within VSCode (ctrl-`)

Congratulations, you now have a fully functional, dockerized  development environment.

If you want the [Fluence Examples](https://github.com/fluencelabs/examples) installed, in your VSCode terminal:

```bash
 cd examples/url-downloader
./build.sh
```

## Development Quickstart

The container also includes a Quick Start tutorial with introductions to

- Aqua -- how to compose peer-to-peer services into applications
- Marine -- how to create service Wasm modules
- fldist -- how to deploy Wasm modules as services to the network

If you encounter any problems or have suggestions, please open an issue or submit a PR.
