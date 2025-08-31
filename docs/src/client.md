```@meta
CurrentModule = OpenGithubModelsApi
```
# Client Initialization

The `GithubModelsClient` is the main entry point for interacting with GitHub's AI Models API.


### Basic Usage

```julia
using OpenGithubModelsApi

# Create a client with default settings
client = GithubModelsClient("your_github_token")

# Create a client with custom settings
client = GithubModelsClient(
    "your_github_token",
    base_url="https://models.github.ai",
    api_version="2022-11-28"
)
```

## Client Parameters

### `auth_token` (Required)

Your GitHub authentication token. This token must have appropriate permissions to access the AI models API.

### `base_url` (Optional)

The base URL for the API. Defaults to `https://models.github.ai`.

### `api_version` (Optional)

The API version to use. Defaults to `2022-11-28`.

## Error Handling

If invalid parameters are provided, the client constructor will throw appropriate errors:

- Invalid URL format will trigger an `ArgumentError`
- Missing authentication token will cause a runtime error when making API calls

## Example

```julia
using OpenGithubModelsApi

# Create a client (using a placeholder token for documentation)
client = GithubModelsClient("ghp_example_token")

println("Client created successfully")
println("Base URL: ", client.base_url)
println("API Version: ", client.api_version)
```

## Best Practices

- Store your authentication token securely (e.g., in environment variables)
- Use the latest stable API version unless you have specific requirements
- Handle potential API errors in your application code

```@raw html
<div class="admonition tip">
  <p class="admonition-title">Tip</p>
  <p>For production applications, consider creating a dedicated GitHub token with only the necessary permissions.</p>
</div>
```