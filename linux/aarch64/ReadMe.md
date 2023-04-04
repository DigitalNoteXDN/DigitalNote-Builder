## Compile for Linux (arm64/aarch64)

First, you get the builder's project.

    git clone https://gitlab.ludoruisch.nl/root/DigitalNote-Builder.git
    cd DigitalNote-Builder

Then download all the library packages.

    ./download.sh

When thats executed, you will have a folder called "download" with all the libraries.

Once thats done, we can install the latest apt-get packages.

    cd linux/aarch64
    ./update.sh

Now we have all the libraries we need for the Digitalnote project.

    git clone https://github.com/IamLupo/DigitalNote-2.git

Now that we have everything, we can compile the libraries.

    ./compile_libs.sh "-j 4"

This will take a while to compile; take a coffee while this runs.

Once finished, we can compile the project.

    ./compile_deamon.sh "-j 4"
    ./compile_app.sh "-j 4"

And thats it! :D

PS: When everything is done, there is a temp folder. This can be removed.