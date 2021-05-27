# devcontainer
Ready development environment. Contains the following utilities:
- `aqua-cli` to compile Aqua to AIR & Typescript
- `fldist` to manage services and execute AIR scripts
- `marine` & `mrepl` to compile Rust to WASM & run it locally


# How to use
1. Install Remote-Containers extension in VSCode
2. Run Remote-Containers: Clone Repository in Container Volume... through command palette (F1 or Cmd-Shift-P)
3. Enter `fluencelabs/devcontainer`
4. When asked for branch, press enter (main)
5. When asked for volume, press enter (unique)
6. open Terminal within VSCode (ctrl-`)

NOTE: all entered commands will be executing _inside_ docker container

7. `cd examples/url-downloader`
8. `./build.sh`
