## DigitalNote-Builder

This is a project to eazily build the qt-wallet and the daemon staticly.

## How to use (64 bits)

First you must get msys2 installed on your windows.

Once msys2 is installed you start SYS2 MINGW64 console.

First you need to update msys2 with the latest compilers and packages by executing.

	./msys2_update.sh

Once msys2 is up-to-date you can download the packages.

	./download.sh

When thats executed you will have a folder called "download" with all the packages.

Now we download all the packages we can compile the libraries.

	cd x64
	./compile_libs.sh

This will take a while to compile like take a coffe while this runs.

Once finished we take the DigitalNote project.

	git clone https://github.com/IamLupo/DigitalNote-2.git

Now we can compile the project.

	compile_app.sh

And thats it! :D

## How to use (32 bits)

First you must get msys2 installed on your windows.

Once msys2 is installed you start SYS2 MINGW64 console.

First you need to update msys2 with the latest compilers and packages by executing.

	./msys2_update.sh

Once msys2 is up-to-date you can download the packages.

	./download.sh

When thats executed you will have a folder called "download" with all the packages.

Now we download all the packages we can compile the libraries.

	cd x86
	./compile_libs.sh

This will take a while to compile like take a coffe while this runs.

Once finished we take the DigitalNote project.

	git clone https://github.com/IamLupo/DigitalNote-2.git

Now we can compile the project.

	compile_app.sh

And thats it! :D

