```@meta
CurrentModule = OpenGithubModelsApi
```

# OpenGithubModelsApi.jl

```@docs
OpenGithubModelsApi
```

**OpenGithubModelsApi.jl** is a Julia client library for interacting with GitHub's AI Models API (https://models.github.ai). This package was automatically generated using [OpenAPI.jl](https://github.com/OpenAPI-Generator/OpenAPI.jl), providing a type-safe and validated interface to GitHub's machine learning models.

## Features

- Type-safe API client for GitHub's AI models
- Secure authentication with GitHub tokens
- Chat completion functionality
- Organization-specific model access
- Model catalog listing
- Comprehensive parameter validation
- Well-structured Julia package with proper documentation

## Installation

To install the package, use Julia's package manager:

```julia
using Pkg
Pkg.add("OpenGithubModelsApi")
```

## Quick Start

```julia
using OpenGithubModelsApi

# Create a client with your GitHub token
client = GithubModelsClient("YOUR_GITHUB_TOKEN")

# Create a message history
messages = [
    Message(role="system", content="You are a helpful assistant"),
    Message(role="user", content="What is Julia programming language?")
]

# Create an inference request
request = InferenceRequest(
    model="publisher/model-name",  # Replace with an actual model ID
    messages=messages,
    temperature=0.7
)

# Get a response
response = create_chat_completion(client, request)
println(response)
```

## Documentation Structure

This documentation is organized into several sections:

- [Client Initialization](client.html) - How to set up the API client
- [Chat Completion](chat_completion.html) - Using the standard chat completion API
- [Organization Features](organization.html) - Working with organization-specific models
- [Model Catalog](models.html) - Listing and understanding available models
- [Data Models Reference](models_reference.html) - Detailed reference for all data structures
- [Troubleshooting](troubleshooting.html) - Common issues and solutions

## Why Use This Package?

This package provides a Julia-native interface to GitHub's AI models API with several advantages over direct API calls:

- **Type Safety**: All API parameters and responses are strongly typed
- **Validation**: Automatic validation of parameters according to GitHub's API specifications
- **Error Handling**: Consistent error handling patterns
- **Simplified Interface**: High-level functions that handle common use cases
- **Documentation**: Comprehensive documentation for all API endpoints

```@raw html
<div class="admonition note">
  <p class="admonition-title">Note</p>
  <p>This package was automatically generated using OpenAPI.jl from GitHub's API specification.</p>
</div>
```

```@raw html
<div class="admonition warning">
  <p class="admonition-title">Warning</p>
  <p>Streaming responses are not currently supported by this package. Attempting to use streaming will result in an error.</p>
</div>
```
