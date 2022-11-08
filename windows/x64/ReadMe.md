## Compile Windows (32 bits)

First you must get msys2 installed on your windows.

Once msys2 is installed you start "MSYS2 MINGW32" console.

First you need to update msys2 with the latest compilers and packages by executing.

	cd windows
	./msys2_update.sh

Once msys2 is up-to-date you can download the packages.

	cd ..
	./download.sh

When thats executed you will have a folder called "download" with all the packages.

Now we download all the packages we can compile the libraries.

	cd windows/x32
	./compile_libs.sh

This will take a while to compile like take a coffe while this runs.

Once finished we take the DigitalNote project.

	git clone https://github.com/IamLupo/DigitalNote-2.git

After we modify the DigitalNote-2/DigitalNote_config.pri to patch boost suffix to 32 bits:

	DIGITALNOTE_BOOST_SUFFIX          = -mgw12-mt-s-x32-1_80

Now we can compile the project.

	./compile_app.sh

And thats it! :D