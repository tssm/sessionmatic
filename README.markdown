sessionmatic.vim is a really simple script that takes care of your
sessions for you:

1. When you run Vim from a directory where there is a readable
   `Session.vim` file sessonmatic.vim will source it.
2. When you close Vim and there is a writtable `Session.vim` file
   in the working directory sessionmatic.vim will save it.

You must create your desired sessions using the standard
`:mksession` command. You must also set your preferred
`sessionoptions`.

# License

[CC0](https://creativecommons.org/publicdomain/zero/1.0/)
