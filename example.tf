output "extension_to_mime_example_1" {
  value = local.extension_to_mime["bin"]
}

## Output ->
# extension_to_mime_example_1 = application/octet-stream

output "extension_to_mime_example_2" {
  value = lookup(local.extension_to_mime, "png", "")
}

## Output ->
# extension_to_mime_example_2 = image/png

output "mime_to_extension_example_1" {
  value = local.mime_to_extension["application/javascript"]
}

## Output -> 
# mime_to_extension_example_1 = [
#   "js",
#   "mjs",
# ]

output "mime_to_extension_example_2" {
  value = lookup(local.mime_to_extension, "application/octet-stream", [])
}

## Output ->
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