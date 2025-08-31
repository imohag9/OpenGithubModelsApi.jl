```@meta
CurrentModule = OpenGithubModelsApi
```
# Organization-Specific Features

GitHub's AI Models API supports organization-scoped models and access controls.


### Example Usage

```julia
using OpenGithubModelsApi

# Create a client (using a placeholder token for documentation)
client = GithubModelsClient("ghp_example_token")

# Create a message history
messages = [
    Message(role="user", content="What models does our organization have access to?")
]

# Create an inference request
request = InferenceRequest(
    model="publisher/model-name",  # Replace with an actual model ID
    messages=messages
)

# Replace "your-org" with your GitHub organization name
response = org_create_chat_completion(client, request, "your-org")
println(response)
```

## Organization-Specific Parameters

- `org`: The GitHub organization name to scope the request to
- All standard `InferenceRequest` parameters apply

## Use Cases

Organization-scoped API calls are useful for:

- Accessing organization-specific models
- Enforcing organization-level security policies
- Managing usage quotas at the organization level
- Working with organization-specific knowledge bases

## Error Handling

Common organization-specific errors include:
- Organization not found
- Insufficient permissions for the organization
- Organization-specific rate limits

!!! note "authentication"
  The authentication token must have appropriate permissions for the specified organization.


## Best Practices

- Verify organization name spelling
- Ensure the authentication token has organization access
- Handle organization-specific errors gracefully
- Consider caching organization model information