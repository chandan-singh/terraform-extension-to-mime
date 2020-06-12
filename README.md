# terraform-extension-to-mime : Terraform Content-Type Utility

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

[Terraform](https://terraform.io/) utility to help conversion between file extension to mime-type or content-type and vice versa

- 1156 file extensions to content-type mapping
- 939 content-type to file extension mapping

## Supported version

- Terraform v0.12 or higher is recommended

  - `mime_to_extension.tf` uses newer types supported only in 0.12 or higher
  - `extension_to_mime.tf` supported in 0.11 or higher

## Usage

### extension to mime-type (content-type)

- Copy `extension_to_mime.tf` into your terraform folder
- Use `local.extension_to_mime[<file-extension>]` or `lookup(local.extension_to_mime, "<file-extension>", "false")` to find content-type associated with a file extension

```hcl
output "extension_to_mime_example_1" {
  value = local.extension_to_mime["bin"]
}

output "extension_to_mime_example_2" {
  value = lookup(local.extension_to_mime, "png", "")
}

## Output ->
# extension_to_mime_example_1 = application/octet-stream
# extension_to_mime_example_2 = image/png
```

### mime-type (content-type) to list of extensions

- Copy `mime_to_extension.tf` into your terraform folder
- Use `local.mime_to_extension["application/octet-stream"]` or `lookup(local.mime_to_extension, "application/octet-stream", [])` to find content-type associated with a file extension

```hcl
output "mime_to_extension_example_1" {
  value = local.mime_to_extension["application/octet-stream"]
}

output "mime_to_extension_example_2" {
  value = lookup(local.mime_to_extension, "application/octet-stream", [])
}

## Output ->
# mime_to_extension_example_1 = [
#   "js",
#   "mjs",
# ]
# mime_to_extension_example_2 = [
#   "bin",
#   "dms",
#   "lrf",
#   "mar",
#   "so",
#   "dist",
#   "distz",
#   "pkg",
#   "bpk",
#   "dump",
#   "elc",
#   "deploy",
#   "exe",
#   "dll",
#   "deb",
#   "dmg",
#   "iso",
#   "img",
#   "msi",
#   "msp",
#   "msm",
#   "buffer",
# ]
```

## Other Usages

In case if the terraform prject reqquires `variables` instead of `locals`, you can make the following changes in the `mime_to_extension.tf` and `extension_to_mime.tf` files:

### mime_to_extension

```hcl
variables "mime_to_extension" {
  type = map(string)         # Or, type = map ## for v 0.11
  default = {
    "1km"                      = "application/vnd.1000minds.decision-model+xml"
    "3dml"                     = "text/vnd.in3d.3dml"
    ...
    ...
  }
}
```

### extension_to_mime

```hcl
variables "extension_to_mime" {
  type = map(list(string)) # Or, NOT SUPPORTED in v 0.11
  default = {
    "application/andrew-inset" = ["ez"]
    "application/applixware" = ["aw"]
    ...
    ...
  }
}
```

## Authors

It is maintained by [Chandan Singh](https://github.com/chandan-singh)

## License

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
