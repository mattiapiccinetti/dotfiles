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
	versions=(8 11 17 18)

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

loop () {
	if [ $# -eq 0 ]; then
		echo "usage: $0 <command> <interval> (execute a program periodically)"
	else
		command=$1
		interval=${2:-1}
		counter=0
		started=$(date)

		while true; do
			clear
			counter=$((counter+1))

			echo -e "Started: \t$started"
			echo -e "Current: \t$(date)"
			echo -e "Command: \t$command"
			echo -e "Interval: \tevery ${interval}s"
			echo -e "Count: \t\t$counter"
			echo

			eval $command
			sleep $interval
		done
	fi
}

work () {
    apps=(
		"Slack.app"
        "Microsoft Teams.app"
        "Microsoft Outlook.app"
		"Citrix Secure Access.app"
    )

    for app in "$apps[@]"; do open -a $app; done
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

git_user () {
	git config user.name "Mattia Piccinetti"
	git config user.email "mattiapiccinetti@users.noreply.github.com"
}

