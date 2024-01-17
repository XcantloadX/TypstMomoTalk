param(
    [string]$input_file_path
)

$typstCommand = "typst watch $input_file_path --root . --font-path ./momotalk/assets/"
Invoke-Expression $typstCommand
