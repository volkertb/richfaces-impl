# richfaces-impl
A patched version of the richfaces-impl dependency, which should work better with IE9 and higher.

## Before you download and/or use any of this, first the DISCLAIMER:

- BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

- IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

( Disclaimer source: clauses 15 and 16 of the LGPL 2.1 license, see https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html )

## JAR file SHA1 checksum

0856af205473518436cddc5e151581f15105aebb

## How to use the patched dependency in your Maven project:
1. Import the JAR file into your organization's local Maven repository (Artifactory, Nexus, etc).
2. Change the version number of the richfaces-impl dependency from 3.3.4.Final to impl-3.3.4.Final_IEFixes
3. Leave the version number of any other richfaces 3.x dependencies in your project (such as richfaces-api and richfaces-ui) at 3.3.4.Final

## How I patched the JAR file

1. I started with richfaces-impl-3.3.4.Final.jar, which can be find in the ZIP file http://downloads.jboss.org/richfaces/releases/3.3.X/3.3.4.Final/richfaces-ui-3.3.4.Final-bin.zip
2. I extracted the JAR from the ZIP file and extracted the JAR itself.
3. I applied step 2 and step 3 of the IE9-specific patches as instructed by Marko Wallin in his blog at https://ruleoftech.com/2013/patching-richfaces-3-3-3-ajax-js-for-ie9
4. I replaced the embedded Sarissa version in AJAX.js with a recent 0.9.9.7-SNAPSHOT build (timestamp 2016-04-01T14:57:21Z), which can be downloaded from https://gist.github.com/volkertb/bd39dad1e7eeb17730e4
5. I replaced the minified embedded Sarissa version in framework.pack.js with the minified version of the same 0.9.9.7-SNAPSHOT build (timestamp 2016-04-01T14:57:21Z), which can also be downloaded from https://gist.github.com/volkertb/bd39dad1e7eeb17730e4
6. I replaced the version string "3.3.4.Final" in pom.xml under META-INF (as well as in other metadata files in the JAR) with the version string "3.3.4.Final\_IEFixes". (In other words: I appended the suffix "\_IEFixes" to the version/release number.)
7. I modified the POM.xml further so that it would no longer depend on any external parent POM.
8. I re-zipped the JAR file after making the above changes and appended the suffix \_IEFixes to the version number in the name of the new JAR file.
9. I deployed the patched JAR file into a local Artifactory server, with both the checkboxes "Deploy as Maven Artifact" and "Deploy Jar's Internal POM/Generate Default POM" checked.
10. I published all the resulting files in this Gihub repository.
