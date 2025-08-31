```@meta
CurrentModule = OpenGithubModelsApi
```
# Data Models Reference

This section provides detailed documentation for all data structures used in the API.

```@autodocs
Modules = [OpenGithubModelsApi]
```
## Parameter Validation Rules

### Temperature and Top P
- Range: 0.0 to 1.0
- Decimal values are supported
- Not recommended to modify both simultaneously

### Message Roles
Valid values: `"assistant"`, `"developer"`, `"system"`, `"user"`

### Tool Choice
Valid values: `"auto"`, `"required"`, `"none"`

### Modalities
Supported values: `"text"`, `"audio"`

```@raw html
<div class="admonition warning">
  <p class="admonition-title">Warning</p>
  <p>Setting <code>stream=true</code> is not supported and will result in an error.</p>
</div>
```

## Best Practices for Data Models

- Always validate required fields before making API calls
- Use the provided type constraints to ensure valid parameters
- Handle optional fields appropriately in your application
- Be aware of enum constraints for string parameters