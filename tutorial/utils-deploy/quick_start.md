# Deployment Quickstart

As we've seen in the Aqua and Marine sections, respectively, applications are composed from services and services are composed from Rust Wasm modules hosted on peer-to-peer nodes. The final step in our development quick start journey is to deploy the a service, i.e., the greetign service, to the network. In order to accomplish our goal, we need:

* The `greeting.wasm` module we developed in the previous section in the `artifacts` directory
* A service configuration file we still need to create
* One or more peer-to-peer target nodes
* The `fldist` command line tool readily available in our devcontainer

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
  fldist create_service  Create a service from existing blueprint           
  fldist new_service     Create service from a list of modules              <-- 1
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

`fldist` provides a variety of commandline utilities to manage modules and services. For the purposes of this tutorial, we are interested in the `new_service` and `env` commands.

1. The `new_service`  command allows us to deploy one or more Wasm modules into a service API. In addition to selecting a deployment method, we also need to decide on which node, or nodes, we want to deploy our service(s).
2. The `env` command lists the nodes comprising the specified network environment. Currently, there are multiple environments, see `fldist env --help`.

For out purposes, we use the default, i.e. Krasnodar network, setting to list available node addresses, which are alos tracked by the Fluence Dashboard](https://dash.fluence.dev/):

```bash
root@56892f4726bb:/workspaces/devcontainer/greeter# fldist env
/dns4/kras-00.fluence.dev/tcp/19990/wss/p2p/12D3KooWSD5PToNiLQwKDXsu8JSysCwUt8BVUJEqCHcDe7P5h45e
/dns4/kras-00.fluence.dev/tcp/19001/wss/p2p/12D3KooWR4cv1a8tv7pps4HH6wePNaK6gf1Hww5wcCMzeWxyNw51
/dns4/kras-01.fluence.dev/tcp/19001/wss/p2p/12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA
/dns4/kras-02.fluence.dev/tcp/19001/wss/p2p/12D3KooWHLxVhUQyAuZe6AHMB29P7wkvTNMn7eDMcsqimJYLKREf
<snip>
/dns4/kras-09.fluence.dev/tcp/19001/wss/p2p/12D3KooWD7CvsYcpF9HE9CCV9aY3SJ317tkXVykjtZnht2EbzDPm
root@56892f4726bb:/workspaces/devcontainer/greeter#
```

Let's use the node with PeerId 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA for our first deployment and the only thing left to do is write a service configuration file, greeter_cfg.json. For our single greeting module service, the configuration file merely needs to specify the name of the service:

```json
// greeter_cfg.json
{
    "name": "greeting"
}
```

You can find the `greeter_cfg.json` file in the `sample-code/configs` directory. To deploy our greeter service to the network with `fldist` we need the greeter wasm module and config file:

```bash
fldist --node-id 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA \
new_service \
--ms ../marine/greeter/artifacts/greeter.wasm:configs/greeter_cfg.json \
--name my-greeter
```

which gives our our service id:

```bash
service id: 38896a64-2a86-4df6-bce9-e29e1688ec9c
service created successfully
```

In summary, we used `fldist new_service` to

* upload our greeter.wasm from the `marine/greeter/artifcacts` directory with associated config file, greeter_cfg.json from the `sample-code/configs` directory
* the node 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA, which is the peer-id for node `/dns4/kras-01.fluence.dev/tcp/19001/wss/p2p/12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA`
* name our service `my-greeter` 

Turns out the service was successfully deployed and in return, we obtain the unique service-id, 38896a64-2a86-4df6-bce9-e29e1688ec9c, which is going to be different for you, that allows us to reference the service in Aqua.

Let's take our service for a test spin. Again, we use `fldist` as our command line client:

```bash
fldist \
--node-id 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA \
run_air \
-p sample-code/air-scripts/greeter.greeter.air \
 -d '{"service_id":"38896a64-2a86-4df6-bce9-e29e1688ec9c", "node": "12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA", "name": "Aqua", "greet": true}' \
 --generated
```

Which gives us the expected result -- just like we had in our introduction to Aqua section:

```bash
[
  "Hi, Aqua"
]
```
