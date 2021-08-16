# Welcome To The Fluence DevContainer

DevContainer is a ready to use development environment for Fluence solutions with VSCode integration containing the following tools:

* [`aqua-cli`](https://www.npmjs.com/package/@fluencelabs/aqua-cli) to compile [Aqua](https://doc.fluence.dev/aqua-book/)
* [`fldist`](https://www.npmjs.com/package/@fluencelabs/fldist) to manage services and optionally execute compiled Aqua from the command line
* [`marine`](https://crates.io/crates/marine) to compile modules developed in Rust to the wasm32-wasi target
* [`mrepl`](https://crates.io/crates/mrepl)  to run, test and debug linked Wasm modules locally

## How to install

Docker and  optionally VSCode need to be available on your system. For Docker installation,
follow the [Get Docker](https://docs.docker.com/get-docker/) instructions for your OS. For VSCode, see [VSCocde](https://code.visualstudio.com/) for instructions.

With Docker and VSCode in place:

1. Install Remote-Containers extension in VSCode
2. Run Remote-Containers: Clone Repository in Container Volume... through command palette (F1 or Cmd-Shift-P)
3. Enter `fluencelabs/devcontainer`
4. When asked for branch, press enter (main)
5. When asked for volume, press enter (unique)
6. open Terminal within VSCode (ctrl-`)

Congratulations, you now have a fully functional Fluence development environment.

If you want to install the [Fluence Examples](https://github.com/fluencelabs/examples), use the VSCode terminal:

```bash
./.devcontainer/.aux/download_examples.sh
cd examples
```

If you encounter any problems or have suggestions, please open an issue or submit a PR. You can also reach out in
[Discord](https://discord.com/invite/aR2AYErM) or [Telegram](https://t.me/fluence_project). For more detailed reference resources, see the [Fluence documentation](https://doc.fluence.dev/docs/) and [Aqua book](https://doc.fluence.dev/aqua-book/).
