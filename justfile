@_default:
    just --list --unsorted

# Build all recipes
build: install-package-dependencies style run-targets build-website-locally

# Build the website locally using Quarto
build-website-locally:
  quarto render gh-pages

# Build the website using Quarto and then upload to GitHub Pages
publish-website-github:
  quarto publish gh-pages

# Clean up all auto-generated files to start from scratch
clean:
  rm -rf _freeze/ _targets/ _site/
  rm _targets.yaml doc/_targets.yaml

# Install package dependencies via renv
install-package-dependencies:
  #!/usr/bin/Rscript
  renv::restore()

# Run the pipeline to re-build the data objects
run-targets:
  #!/usr/bin/Rscript
  targets::tar_make()

# Style all R code in the package
style:
  #!/usr/bin/Rscript
  styler::style_dir(
    include_roxygen_examples = FALSE
  )
