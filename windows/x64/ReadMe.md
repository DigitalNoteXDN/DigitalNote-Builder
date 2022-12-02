## Compile Windows (64 bits)

First you must get msys2 installed on your windows.

	https://www.msys2.org/

Once msys2 is installed it start "MSYS2 UCRT64" console. Close this window.
Click windows symbol(left bottom) and search for "MSYS2 MINGW64" and start the console.

First we will patch MSYS2 with the latest updates:

	pacman -Syu

After the upgrade it ask to restart "MSYS2 MINGW64".

Once MSYS2 is up-to-date you can download the libraries.

	cd /c/Users/iamlupo/Desktop/DigitalNote-Builder
	./download.sh

When thats executed you will have a folder called "download" with all the libraries.

Once thats done we can install the latest MSYS2 packages by executing.

	cd windows/x64
	./update.sh

Now we have all the libraries we need the Digitalnote project

	git clone https://github.com/IamLupo/DigitalNote-2.git

Now we have everything we can compile the libraries.

	./compile_libs.sh "-j 4"

This will take a while to compile like take a coffe while this runs.

Once finished we can compile the project.

	./compile_daemon.sh  "-j 4"
	./compile_app.sh  "-j 4"

And thats it! :D

PS: When everything is done there is a temp folder. This can be removed.