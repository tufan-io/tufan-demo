# tufan-demo
A module to demo the capabilities of the tufan-cli.


## Usage

### 1. Install tufan-cli binary
If installing locally, please ensure tufan 
binary is in the path

```
npm i tufan-io/tufan-cli -g
```

### 2. Clone demo repository
clone this repo 
```
git clone https://github.com/tufan-io/tufan-demo
cd  tufan-demo
```

### 3. Running the demo

`tufan-cli` provides a CLI interface for two workflows: 
1. The provider-author
2. The system-architect

The provider author builds library resources that provide the capability
to do something useful with the core tufan-cli. This includes defining the
data-model to configure/manage a resource and the code that implements the
basic lifecycle events - Create-Update-Read-Delete. Each provider supports
multiple resources and relationships between them. `tufan-cli` provides
first class support for creating/deleting the boiler-plate code that 
enables this functionality.


The system architect uses pre-defined providers and contained resources to
architect a system. `tufan-cli` providers first-class support to create,
configure and deploy this architecture.

This is an early version of show-and-tell. We'll get into the details in due
course. However, it's important to undestand the need to a `tufan-registry`
and it's use, if one is to understand the workings of the demo.

The providers created by provider-authors are TypeScript modules,  
The `tufan-registry` is designed to work in a version-locked manner with an
npm-registry. A parallel registry is necessary to support individual files
for provider-metadata and individual resource-schemae. 

> NOTE:
> If this sounds too complicated, please let it slide for the moment. 
> We are taking every possible step to make this as smooth and transparent to 
> you eventually. Given that you are seeing a version of `tufan.cloud` before 
> the paint dries, we are forced to expose this implementation detail to you.

## Demo scripts
This repo provides the following demo scripts:
1. `npm run provider-author`: The provider author workflow for a mock provider (no provider specific code + provisioning on real provider)
2. `npm run system-architect`: Uses the mock provider to create a simple composition to exhibit the system-architect workflow
3. `npm run teardown`: Tears-down the composition created in step #2.

Internally, there are OS specific scripts provided for each - batch files for [windows](./demo/win), and bash scripts from [*nix/macos](./demo/nix).
```

All these scripts create any necessary artifacts in a .tmp directory, local to the repo.