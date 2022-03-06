Dotfiles
=================

To install run `./install`.

To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`.

To upgrade your submodules to their latest versions, you could periodically run
`git submodule update --init --remote`.

This is setup with [Dotbot](https://github.com/anishathalye/dotbot)
