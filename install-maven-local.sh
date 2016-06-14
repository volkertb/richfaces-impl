#!/bin/bash

cd $(dirname $0)

exitFail() {
	exitCode=${1:-?}
	echo "[ERROR] Exit code $1"
	exit $1
}

userName=$1
if [ -z "${username}" ]; then
	echo "[ERROR] Missing username"
	echo ""
	echo "Usage:"
	echo "       ${0} <username>"
	echo "       ${0} <username:password>"
	echo ""
	exit 1
fi

[[ -d target ]] && rm -rf target
[[ -d target ]] || mkdir target

# download from GitHub
# curl options:
#   -f -- fail with non-zero exitcode
#   -u -- username or username:password
#   -L -- follow redirects
#   -o -- output file
curl -f -u ${userName} -L -o target/richfaces-impl-3.3.4.Final_IEFixes.jar https://github.com/volkertb/richfaces-impl/releases/download/3.3.4.Final_IEFixes/richfaces-impl-3.3.4.Final_IEFixes.jar || exitFail $?
curl -f -u ${userName} -L -o target/richfaces-impl-3.3.4.Final_IEFixes.pom https://github.com/volkertb/richfaces-impl/releases/download/3.3.4.Final_IEFixes/richfaces-impl-3.3.4.Final_IEFixes.pom || exitFail $?

# See also documentation at https://maven.apache.org/guides/mini/guide-3rd-party-jars-local.html
mvn install:install-file -Dfile=target/richfaces-impl-3.3.4.Final_IEFixes.jar -DpomFile=target/richfaces-impl-3.3.4.Final_IEFixes.pom || exitFail $?

rm -rf target