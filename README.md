# OpenGithubModelsApi.jl

[![CI](https://github.com/imohag9/OpenGithubModelsApi.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/imohag9/OpenGithubModelsApi.jl/actions/workflows/CI.yml)
[![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://imohag9.github.io/OpenGithubModelsApi.jl/dev)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

**OpenGithubModelsApi.jl** is a Julia client library for interacting with GitHub's AI Models API (https://models.github.ai). This package was automatically generated using [OpenAPI.jl](https://github.com/JuliaComputing/OpenAPI.jl), providing a type-safe and validated interface to GitHub's machine learning models.

## Features

- 🚀 Type-safe API client for GitHub's AI models
- 🔒 Secure authentication with GitHub tokens
- 💬 Chat completion functionality
- 🏢 Organization-specific model access
- 📚 Model catalog listing
- ⚙️ Comprehensive parameter validation
- 📦 Well-structured Julia package with proper documentation


## Create your personal GitHub access tokens

[Github Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token)

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
response = inference_req(client, request)
println(response)
```

## Usage Examples

### Basic Chat Completion

```julia
using OpenGithubModelsApi

client = GithubModelsClient("YOUR_GITHUB_TOKEN")

# Create a message history
messages = [
    Message(role="system", content="You are a helpful assistant"),
    Message(role="user", content="Explain machine learning in simple terms")
]

# Create an inference request
request = InferenceRequest(
    model="openai/gpt-4.1",  # Example model ID
    messages=messages,
    temperature=0.5,
    max_tokens=200
)

# Get a response (returns just the content by default)
response = inference_req(client, request)
println(response)

# For full response details, use verbose=true
full_response = inference_req(client, request, verbose=true)
```

### Organization-Specific Chat Completion

```julia
using OpenGithubModelsApi

client = GithubModelsClient("YOUR_GITHUB_TOKEN")

messages = [
    Message(role="user", content="What models does our organization have access to?")
]

request = InferenceRequest(
    model="publisher/model-name",
    messages=messages
)

# Replace "your-org" with your GitHub organization name
response = org_inference_req(client, request, "your-org")
println(response)
```

### Listing Available Models

```julia
using OpenGithubModelsApi

client = GithubModelsClient("YOUR_GITHUB_TOKEN")
models = list_models(client)

# Print available models
for model in models
    println("Model: $(model.name) (ID: $(model.id))")
    println("Publisher: $(model.publisher)")
    println("Summary: $(model.summary)")
    println("---")
end
```

## API Reference

### Client Initialization

```julia
client = GithubModelsClient(auth_token; 
                           base_url="https://models.github.ai", 
                           api_version="2022-11-28")
```

### Main Functions

- `inference_req(client, request; verbose=false)` - Creates a standard chat completion
- `org_inference_req(client, request, org; verbose=false)` - Creates an organization-scoped chat completion
- `list_models(client)` - Lists all available models

### Data Models

The package provides comprehensive type definitions for all API interactions:

- `InferenceRequest` - Request structure for chat completions
- `Message` - Represents individual chat messages
- `ModelData` - Contains metadata about available models
- Various response types for handling API responses

## Important Notes

- **Streaming is not supported** - The API will return an error if `stream=true` is specified in the request
- All parameters are validated according to GitHub's API specifications
- Temperature values must be between 0-1
- Message roles must be one of: "assistant", "developer", "system", "user"

## Documentation

For complete documentation, visit [https://imohag9.github.io/OpenGithubModelsApi.jl/stable](https://imohag9.github.io/OpenGithubModelsApi.jl/dev).

## Testing

The package includes a comprehensive test suite that can be run with:

```julia
using Pkg
Pkg.test("OpenGithubModelsApi")
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

