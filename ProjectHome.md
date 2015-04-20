Awib is a [brainfuck](http://en.wikipedia.org/wiki/Brainfuck) compiler written in brainfuck. It's portable, optimising, polyglot and supports multiple target platforms.

Awib compiles brainfuck source code into well performing 386 Linux binaries, C code, Ruby code, Go code and Tcl code.

Awib is itself polyglot in brainfuck, C, bash and Tcl.

Have a look at the [latest release](http://awib.googlecode.com/svn/builds/awib-0.3.b) for more information.

## Releases ##
| **2010-10-04** | [Awib 0.3](http://awib.googlecode.com/svn/builds/awib-0.3.b) is out. A Tcl backend has been added and the build has itself been made polyglot in Tcl. Is it the bomb? Yes, it is. |
|:---------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2010-04-22 | [Awib 0.2](http://awib.googlecode.com/svn/builds/awib-0.2.b) is out \o/. It features two new language backends: Go and Ruby; polyglotness in C and bash; testing and bugfixes. It's awesome. You'll love it. |
| 2008-11-01 | We're proud to announce the official release of [awib-0.1](http://awib.googlecode.com/svn/builds/awib-0.1.b). The fully commented source code is available in [subversion](http://code.google.com/p/awib/source/browse/#svn/tags/awib-0.1) and as a [tar-ball](http://awib.googlecode.com/files/awib-0.1.tar.gz). This release is the first to be hosted by Google Code.|
| 2008-03-24 | Update of the awib beta: [awib-1.0rc6-BETA.b](http://awib.googlecode.com/svn/builds/awib-1.0rc6-BETA.b) This version most significantly fixes a bug causing segmentation faults under certain conditions. Also new is an improved implementation of the loop operation for the 386\_linux backend, which will boost performance in some situations.|
| 2007-10-27 | Here's a a beta of the new awib release: [awib-1.0rc5-BETA.b](http://awib.googlecode.com/svn/builds/awib-1.0rc5-BETA.b). It's a complete rewrite, shares no code with the previous version and offers a host of new features (improved optimizations, multiple target platforms (C and 386-linux) and improved portability). In time, we'll make a full release and it'll be awesome!|
| 2004-06-01 | [Awib v1.0-rc4](http://awib.googlecode.com/svn/builds/awib-1.0rc4.b) is out. A minor ELF-header glitch was fixed. Also, to make life easier for the FreeBSD crowd, awib now prebrands it's output so you won't have to run brandelf(1) on every binary to make it work with the Linux ABI.|
| 2004-05-03 | [Awib v1.0-rc3](http://awib.googlecode.com/svn/builds/awib-1.0rc3.b) is out. Awib is now officially an optimizing compiler. Previously, a string of n '-' or '+' instructions would compile into n\*2 bytes of machine code. As of this version, such strings will instead compile into a single 3 byte machine instruction. Awesome!|
| 2004-02-24 | [Awib v1.0-rc2](http://awib.googlecode.com/svn/builds/awib-1.0rc2.b) is out. The stack has been enlarged to avoid overflows when compiling deep nested loops. Approximately 190 levels of nested loops are now required to cause a crash, as opposed to the 40 levels of rc1.|
| 2004-01-18 | awib v1.0-rc1 |