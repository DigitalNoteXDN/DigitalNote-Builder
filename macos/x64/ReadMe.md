## Compile Macos (64 bits)

First you need all the libraries.

	cd macos/x64
	bash update.sh

Once everything is up-to-date you can download the packages.

	cd ../..
	bash download.sh

When thats executed, you will have a folder called "download" with all the packages.

Now that we downloaded all the packages, we need the DigitalNote project

	cd macos/x64
	git clone https://github.com/IamLupo/DigitalNote-2.git

Now we have everything we can compile the libraries.

	bash compile_libs.sh "-j 4"

This will take a while to compile like take a coffee while this runs.

Now we can compile the project.

	bash compile_app.sh "-j 4"
	bash compile_daemon.sh "-j 4"

Once the app is created we can deploy the DigitalNote-QT version.

	bash deploy.sh

And thats it! :D

PS: When everything is done there is a temp folder. This can be removed.