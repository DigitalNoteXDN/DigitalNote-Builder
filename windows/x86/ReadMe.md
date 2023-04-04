## Compile for Windows (32 bits)

First, you must get MSYS2 installed on your Windows.

	https://www.msys2.org/

Once MSYS2 is installed, it starts the "MSYS2 UCRT64" console. Close this window.
Click the Windows symbol (left bottom), search for "MSYS2 MINGW32" and start the console.

Second, we will patch MSYS2 with the latest updates:

	pacman -Syu

After the upgrade, it asks to restart "MSYS2 MINGW32".

Once MSYS2 is up-to-date, you can download the libraries.

	cd /c/Users/iamlupo/Desktop/DigitalNote-Builder
	./download.sh

When thats executed, you will have a folder called "download" with all the libraries.

Once thats done, we can install the latest MSYS2 packages by executing.

	cd windows/x86
	./update.sh

Now we have all the libraries we need for the Digitalnote project.

	git clone https://github.com/IamLupo/DigitalNote-2.git

Now that we have everything, we can compile the libraries.

	./compile_libs.sh "-j 4"

This will take a while to compile; take a coffee while this runs.

Now we modify the DigitalNote-2/DigitalNote_config.pri to patch the boost suffix to 32 bits:

	DIGITALNOTE_BOOST_SUFFIX          = -mgw12-mt-s-x32-1_80

Once finished, we can compile the project.

	./compile_deamon.sh  "-j 4"
	./compile_app.sh  "-j 4"

And thats it! :D

PS: When everything is done, there is a temp folder. This can be removed.