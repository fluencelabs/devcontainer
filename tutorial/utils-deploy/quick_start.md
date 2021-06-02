# Deployment Quickstart

As we've seen earlier, applications are composed from services and services are composed from Rust Wasm modules hosted on peer-to-peer nodes.
THE final step in our development quick start journey is to deploy the greeting service to peer-to-peer node(s). In order to accomplish our goal, we need:

* The greeting.wasm module we developed in the previous section
* A service configuration file we still need to create
* One or more peer-to-peer target nodes
* The `fldist` commandline tool readily available in our devcontainer

Let's explore the `fldist` tool:

```bash
root@56892f4726bb:/workspaces/devcontainer/greeter# fldist --help
Usage: fldist <cmd> [options]

Commands:
  fldist completion      generate completion script
  fldist upload          Upload selected wasm
  fldist get_modules     Print all modules on a node                       
  fldist get_interfaces  Print all services on a node
  fldist get_interface   Print a service interface
  fldist add_blueprint   Add a blueprint
  fldist create_service  Create a service from existing blueprint           <-- 1
  fldist new_service     Create service from a list of modules
  fldist deploy_app      Deploy application
  fldist create_keypair  Generates a random keypair
  fldist run_air         Send an air script from a file. Send arguments to
                         "returnService" back to the client to print them in the
                         console. More examples in "scripts_examples" directory.
  fldist monitor
  fldist env             show nodes in currently selected environment       <-- 2

Options:
      --help             Show help                                     [boolean]
      --version          Show version number                           [boolean]
  -v, --verbose          Display verbose information such as created client seed
                         + peer Id and relay peer id  [boolean] [default: false]
  -s, --seed             Client seed                                    [string]
      --env              Environment to use
           [required] [choices: "krasnodar", "local", "testnet", "stage", "dev"]
                                                          [default: "krasnodar"]
      --node-id, --node  PeerId of the node to use
      --node-addr        Multiaddr of the node to use
      --log              log level
       [required] [choices: "trace", "debug", "info", "warn", "error"] [default:
                                                                        "error"]
      --ttl              particle time to live in ms
                                            [number] [required] [default: 60000]
root@56892f4726bb:/workspaces/devcontainer/greeter# 
```

`fldist` provides a variety of commandline utilities to manage modules and services. For the purposes of this tutorial, we are interested in the `new_service`  utility (1), which allows us to deploy one or more modules bundled into a composable service API. In addition to selecting a deployment method, we also need to decide on which node, or nodes, we want to deploy our service(s). `fldist` provides the `env` argument to list node information. Currently, there are multiple environments, see `fldist env --help`, and we will use the default settings:

```bash
root@56892f4726bb:/workspaces/devcontainer/greeter# fldist env
/dns4/kras-00.fluence.dev/tcp/19990/wss/p2p/12D3KooWSD5PToNiLQwKDXsu8JSysCwUt8BVUJEqCHcDe7P5h45e
/dns4/kras-00.fluence.dev/tcp/19001/wss/p2p/12D3KooWR4cv1a8tv7pps4HH6wePNaK6gf1Hww5wcCMzeWxyNw51
/dns4/kras-01.fluence.dev/tcp/19001/wss/p2p/12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA
/dns4/kras-02.fluence.dev/tcp/19001/wss/p2p/12D3KooWHLxVhUQyAuZe6AHMB29P7wkvTNMn7eDMcsqimJYLKREf
/dns4/kras-03.fluence.dev/tcp/19001/wss/p2p/12D3KooWJd3HaMJ1rpLY1kQvcjRPEvnDwcXrH8mJvk7ypcZXqXGE
/dns4/kras-04.fluence.dev/tcp/19001/wss/p2p/12D3KooWFEwNWcHqi9rtsmDhsYcDbRUCDXH84RC4FW6UfsFWaoHi
/dns4/kras-05.fluence.dev/tcp/19001/wss/p2p/12D3KooWCMr9mU894i8JXAFqpgoFtx6qnV1LFPSfVc3Y34N4h4LS
/dns4/kras-06.fluence.dev/tcp/19001/wss/p2p/12D3KooWDUszU2NeWyUVjCXhGEt1MoZrhvdmaQQwtZUriuGN1jTr
/dns4/kras-07.fluence.dev/tcp/19001/wss/p2p/12D3KooWEFFCZnar1cUJQ3rMWjvPQg6yMV2aXWs2DkJNSRbduBWn
/dns4/kras-08.fluence.dev/tcp/19001/wss/p2p/12D3KooWFtf3rfCDAfWwt6oLZYZbDfn9Vn7bv7g6QjjQxUUEFVBt
/dns4/kras-09.fluence.dev/tcp/19001/wss/p2p/12D3KooWD7CvsYcpF9HE9CCV9aY3SJ317tkXVykjtZnht2EbzDPm
root@56892f4726bb:/workspaces/devcontainer/greeter#
```

This results in a list of all the nodes comprising the Krasnodar testnet, which are also tracked by the [Fluence Dashboard](https://dash.fluence.dev/). Let's use the node with PeerId 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA for our first deployment and the only thing left to do is write a service configuration file, greeter_cfg.json:

Since our service is comprised of one simple module, our configuration is limited to naming the module:

```json
// greeter_cfg.json
{
    "name": "greeting"
}
```

Create a folder named `configs` in the greeter project and add the above greeter_cfg.json file. 

We are finally ready to deploy our greeter service to the testnetwork:

```bash
fldist --node-id 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA  new_service --ms artifacts/greeter.wasm:configs/greeter_cfg.json --name tutorial-greeter
service id: c9a315de-4fe2-4730-8f40-9209428383bc
service created successfully   
root@56892f4726bb:/workspaces/devcontainer/greeter# 
```

We used `fldist new_service` to upload our greeter.wasm to the testnet node 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA and provided a service configuration file, greeter_cfg.json, for node services to register our service named tutorial-greeter. In return, we obtain the unique service-id, c9a315de-4fe2-4730-8f40-9209428383bc which is going to be different for you, that allows us to reference the service in Aqua.

Before we conclude, let's check if that module actually has been deployed to our target node with the `fldist get_module` call:

```bash
root@56892f4726bb:/workspaces/devcontainer/greeter# fldist --node-id 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA  get_modules --pretty| grep -B 13 -A 1  greet   
  {
    "config": {
      "logger_enabled": true,
      "logging_mask": null,
      "mem_pages_count": 100,
      "mounted_binaries": null,
      "wasi": {
        "envs": null,
        "mapped_dirs": null,
        "preopened_files": []
      }
    },
    "hash": "9af450928626beefab6c055bd6d6ddb4ae9c59344614cee7083e7be7d5fc93c2",
    "name": "greeting"
  },
root@56892f4726bb:/workspaces/devcontainer/greeter#
```

And sure enough, our target node 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA has the module we just uploaded.
