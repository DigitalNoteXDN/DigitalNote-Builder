## Compile Windows (64 bits)

First you must get msys2 installed on your windows.

Once msys2 is installed you start "MSYS2 MINGW64" console.

First you need to update msys2 with the latest compilers and packages by executing.

	cd windows
	./msys2_update.sh

Once msys2 is up-to-date you can download the packages.

	cd ..
	./download.sh

When thats executed you will have a folder called "download" with all the packages.

Now we download all the packages we need the Digitalnote project

	cd windows/x64
	git clone https://github.com/IamLupo/DigitalNote-2.git

Now we have everything we can compile the libraries.

	./compile_libs.sh "-j 4"

This will take a while to compile like take a coffe while this runs.

Once finished we can compile the project.

	./compile_daemon.sh  "-j 4"
	./compile_app.sh  "-j 4"

And thats it! :D

PS: When everything is done there is a temp folder. This can be removed.