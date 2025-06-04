# OpenGithubModelsApi

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://imohag9.github.io/OpenGithubModelsApi.jl/dev/)
[![Build Status](https://github.com/imohag9/OpenGithubModelsApi.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/imohag9/OpenGithubModelsApi.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Description

This package provides a Julia API client for interacting with the Github Models API. It allows you to create chat completions, create chat completions for organizations, and list available models.

## Installation

To install the package, use the following command:

```julia
using Pkg
Pkg.add("OpenGithubModelsApi")
```

## Usage

### Getting an access token

To use the package, you need to creat a GitHub fine-grained personal access token  [Github_Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token) with permission to access github models granted to the token. Once you have obtained it, you need to set the `GITHUB_TOKEN` environment variable. You can do this by adding the following line to your `.env` file:

```
GITHUB_TOKEN=<your_token>
```

You can also use multiple API keys by adding suffixes to the `GITHUB_TOKEN` environment variable. For example:

```
GITHUB_TOKEN_SUFFIX1=<your_token_1>
GITHUB_TOKEN2=<your_token_2>
```

You can then use the `suffix` argument to retrieve the results with the corresponding token. For example:

```julia
req_1 = inference_req(request;suffix="_SUFFIX1")
req_2 = org_inference_req(request, "my-org";suffix="2")
req_3 = get_all_models(;suffix="_SUFFIX1")
```

### Creating a Chat Completion

To create a chat completion, use the `inference_req` function. This function takes an `InferenceRequest` object as input. Here's an example:

```julia
using OpenGithubModelsApi

request = InferenceRequest(
    model = "openai/gpt-4.1",
    messages = [
        Message(role = "user", content = "Hello, how are you?")
    ]
)

response = inference_req(request)

println(response)
```

### Creating a Chat Completion for an Organization

To create a chat completion for an organization, use the `org_inference_req` function. This function takes an `InferenceRequest` object and an organization name as input. Here's an example:

```julia
using OpenGithubModelsApi

request = InferenceRequest(
    model = "openai/gpt-4.1",
    messages = [
        Message(role = "user", content = "Hello, how are you?")
    ]
)

response = org_inference_req(request, "my-org")

println(response)
```
####  Additional Notes

* Streaming Responses is not supported

### Listing Available Models

To list available models, use the `get_all_models` function. Here's an example:

```julia
using OpenGithubModelsApi

models = get_all_models()

println(models)
```


## License

This package is licensed under the MIT License.