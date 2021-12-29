#!/bin/bash

path () {
	[[ $# -eq 0 ]] && echo "usage: $0 <filename> (show absolute file path)" || echo "$(pwd)/$1"
}

uuid () {
    echo "${$(uuidgen):l}" | tr -d '\n' | pbcopy
}

pk () {
	[[ $# -eq 0 ]] && echo "usage: $0 <port> (kill a process by port)" || lsof -ti :$1 | xargs kill
}

init_jdks () {
	versions=(8 11 17)

	for version in "$versions[@]"
	do
		echo
		echo "Adding OpenJDK $version to jEnv"
		jenv add $(brew --prefix)/opt/openjdk@$version/libexec/openjdk.jdk/Contents/Home

		echo "Symlinking OpenJDK $version directory to /Library/Java/JavaVirtualMachines"
		sudo ln -sfn $(brew --prefix)/opt/openjdk@$version/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-$version.jdk
	done

	plugins=("maven" "export")
	for plugin in "$plugins[@]"
	do
		echo
		echo "Enabling jEnv plugin: $plugin"
		jenv enable-plugin $plugin
	done

	echo
	echo "Installed JDKs:"
	jenv versions --bare

	echo
	echo "JAVA_HOME: $JAVA_HOME"

	echo
	jenv doctor
}

lonfo () {
	cat << EOF


	Il Lonfo

	Il Lonfo non vaterca né gluisce
	e molto raramente barigatta,
	ma quando soffia il bego a bisce bisce
	sdilenca un poco e gnagio s'archipatta.
	È frusco il Lonfo! È pieno di lupigna
	arrafferia malversa e sofolenta!
	Se cionfi ti sbiduglia e ti arrupigna
	se lugri ti botalla e ti criventa.

	Eppure il vecchio Lonfo ammargelluto
	che bete e zugghia e fonca nei trombazzi
	fa lègica busìa, fa gisbuto;

	e quasi quasi in segno di sberdazzi
	gli affarferesti un gniffo. Ma lui zuto
	t'alloppa, ti sbernecchia; e tu l'accazzi.


	Fosco Maraini


EOF
}
