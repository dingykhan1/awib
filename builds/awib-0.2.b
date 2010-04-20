#define EOF /*
cat>>/dev/null<<EOF

[ awib-0.2

Awib's Written In Brainfuck (awib) is a brainfuck compiler written in
brainfuck.

Notable features: optimization, portability and support for multiple
target platforms.

As of version 0.2, awib is a 3-language polyglot; in addition to being
fully functional brainfuck, it is also compileable C and executable
bash script.


== Usage

Feed awib brainfuck source code as input and the compiled program
will be written as output.

Awib is a cross-compiler. The supported target platforms are
listed in table 1. By default, the target "lang_c" is chosen.

To specify a target platform, insert a line on the form "@TARGET"
(without the quotation marks and with "TARGET" suitably replaced)
at the very beginning of the source code you wish to compile.
Awib will then produce output accordingly.

 +----------------+--------------------------------------------+
 |   TARGET       |   Description                              |
 +----------------+--------------------------------------------+
 | 386_linux      | Linux on i386                              |
 +----------------+--------------------------------------------+
 | lang_c         | C programming language                     |
 +----------------+--------------------------------------------+
 | lang_ruby      | Ruby programming language                  |
 +----------------+--------------------------------------------+
 | lang_go        | Go programming language                    |
 +----------------+--------------------------------------------+
       Table 1 - Available target platforms

For instance, the following input would produce an executable hello
world-program for Linux:

  @386_linux
  ++++++[->++++++++++++<]>.----[--<+++>]<-.+++++++..+++.[--->+<]>-----.--
  -[-<+++>]<.---[--->++++<]>-.+++.------.--------.-[---<+>]<.[--->+<]>-.

The following would produce a hello world-program in Ruby:

  @lang_ruby
  ++++++[->++++++++++++<]>.----[--<+++>]<-.+++++++..+++.[--->+<]>-----.--
  -[-<+++>]<.---[--->++++<]>-.+++.------.--------.-[---<+>]<.[--->+<]>-.

And this would give you the hello world-program in C:

  @lang_c
  ++++++[->++++++++++++<]>.----[--<+++>]<-.+++++++..+++.[--->+<]>-----.--
  -[-<+++>]<.---[--->++++<]>-.+++.------.--------.-[---<+>]<.[--->+<]>-.


== Optimizations

Awib is an optimizing compiler:

 o) Sequences of '-','>','<' and '+' are contracted into single
    instructions. E.g. "----" is replaced with a single SUB(4).

 o) Mutually cancelling instructions are reduced. E.g. "+++-->><"
    is equivalent to "+>" and is compiled accordingly.

 o) Some common constructs are identified and replaced with single
    instructions. E.g. "[-]" is compiled into a single CLEAR-
    instruction.

 o) Loops known to never be entered are removed. This is the case
    for loops opened at the very beginning of a program (when all
    cells are 0) and loops opened immediately after the closing
    of another loop.


== Requirements

Awib will run smoothly in any brainfuck environment where:

   o) Cells are 8-bit or larger

   o) The read instruction ',' (comma) issued after end of
      input results in 0 being written OR -1 being written
      OR no change being made to the cell at all.

The vast majority of brainfuck environments meet these criteria.

Since awib is polyglot, it is also possible to compile and/or run awib
directly as C or bash. For instance, using gcc, the following will
build an executable file called awib from awib-0.2.b.

$ cp awib-0.2.b awib-0.2.c
$ gcc awib-0.2.c -o awib.tmp
$ ./awib.tmp < awib-0.2.b > awib-0.2.c
$ gcc -O2 awib-0.2.c -o awib

Using bash works fine, but is very very very slow:

$ (echo "@386_linux"; cat awib.b) | bash awib.b > awib
$ chmod +x awib

== Environment

Code compiled with awib will execute in an environment where:

   o) Cells are 8-bit wrapping integers.

   o) Issuing the read instruction ',' (comma) after
      end of input results in the current cell being
      left as is  (no-change on EOF).

   o) At least 2^16-1 = 65535 cells are available.

   o) Operating beyond the available memory, in either
      direction, results in undefined behaviour.


== License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

Mats Linander 2010-04-04
matslina (at) gmail (d0t) com
]

[*/
#define KK char *K
#define true char *K
true;
#define _K_(___,_K,__)(K[_KK]^(___))?_K_^_K_:_K _K_ __;
_K_,_KK,__K,____,__[4>>002<<020]; _(__){__K=____?__K:__;____=__;while(
__K){__K+=*(__*__*__+_KK+K)-0133?22^_KK[K+__]^'K'?'.'^'u'^'[':-(__[_KK
+K]&1):__*__;_KK+=__;_(__);}}___(){while(K[++_KK]){    _K_('v'^']',__[
,]++)_K_(055|___==___,__[,]--)_K_('K'^'u',,++)_K_('w'^'K',--,)_K_('_'^
4,__[,]?_(_KK[K]&1>>1):_(_KK[K]&1))_K_('v'^'+',__[,]?_((_KK[K]&2)-(_KK
[K]&1)):_(0))K[_KK]-46?_(__[_K_]&1>>1):putchar(__[_K_]);if(_KK[K]^(1<<
1^'.'))_(0);else{__[_K_]=getchar();}}}main(){--_KK;___();}
/*]*/
EOF
KK="\
>>>>>>>>>>>>>>>>>>>>++>>>>+[>[-],+[->+>+<<]>>[-<<+>>]+<[-[>+++++[-<--- \
---->]+<-[-[-[-[--------------[--[-->>+<<[>>-<++[-<--------->]+<[--[>+ \
++++++++[-<++     ++++++++>]<[-]]]]]]]]]]]<->]>[-<<<->>>]<<<]>>>>[->++ \
+++++++++++         +++++++<<<<[-]>>>+[-<,+[-<+<+>>]+<<->[-[---------[ \
-[---[>+               +++[-<--   -->]+<+[-----------[-[-[-[---------- \
----[--                [>++[-      <--------->]+<--[--[>+++++++++[-<++ \
++++++                  ++>]<        [-]]]]]]]]]]]]]]]+>[-<->]>>[->+<] \
<<<[->     >>+>->+<[     >-]>         [>]<[-<<->>]<<<<<]>>>]+>[<-]<[<] \
>[-<<<    ,>>>>]<<<<+    [->+<]  >[   -<<[<]<<<+>>>>[>]>]+++++++++++++ \
++++++   +>>>>[-<<<<-    >>>>]<<<+++  +++<<<[<]<<<->>>>[>]>>[[->+>+<<] \
>[-<+>   ]+>-[-[-[-[-   [-[<->[-]]<[  ->+++++++++[->+>++++++++++++<<]> \
>[->+>   +>+>+>+>+>+>   +>+<<<<<<<<   <]>>----------->++>----->------- \
------>    ++++++>++   +++++++>---    ------->+++++++++++++<<<<<<<<<<< \
<]>]<[->+                             ++++++++++[->+>++++++++++<<]>>[- \
>+>+>+>                              +>+>+>+>+>+>+>+<<<<<<<<<<<]>-->-- \
------                              ----->>------->--------------->++> \
++++++                            +++++>++++++>------>+<<<<<<<<<<<<<]> \
]<[->>                           +++++++[->+++++++<]+++++++>[->++>++>+ \
+>++>+   +>++>++<<<<<<<]>++++++++++>->++++++++++++>+++++>--->+++++>+++ \
++++++ ++++<<<<<<<<<<]>]<[->>+++++++[->+++++++<]++++++++++>[->++>++>++ \
>++>++ >++>++>++>++>++<<<<<<<<<<]>++++++++++>->++++++++++++>+++++>---> \
++>+++++++++++++++++++>+++++++++++>+  ++++++++++>+++++++++++++++++++++ \
++<<<<<<<<<<<<<]>]<[->>+++++++[->+++  ++++<]++++++>[->++>++>++>++>++>+ \
+<<<<<<]>++++++++++>->++++++++++      ++>+++++>--->+<<<<<<<<<]>]<[->>+ \
++++++[->+++++++<]+++++++++>[-        >+>+>+>++>++>++>++>++>++<<<<<<<< \
<]>++>+++++++>+++++>--->+             +++++++++>+++++++>++++++++++++>+ \
++++++++++++++++++>++                 ++++++++++++++++++++<<<<<<<<<<<< \
]<<[->>+>>-<<<<]>>                    [-<<+>>]>+>[<++++[->++++<]>[-]]< \
[-<+<<<<[<]>[[                    -<  +<+>>]<[>>[>]>>>>>[>]>+>[<-]<[<] \
>[-<<[<]<                    [-]<<<<[<]<[-]+>>[>]>>>>>[>]>>+<]>-<<<[<] \
<<<<<[<                    ]<-]>>[>]>>>>>[>]>>[[-]<<<[<]<[-]>>[>]>>]<< \
+[<]<<<               <<[<]>]<<<[[->>+<<]<]>>>[>]>>>>>[>]<[-<]<[-<<<<[ \
<]<<<<[-]>>>       >>[>]>>[-<<<[<]<<<<+>>>>>[>]>>]+>]>]>>>[>]<[[-]<]<< \
<<-]<[-]<<[[-]       <]<<<+[->>>>+<<<<]>>>>->>>]<<<+[->>>>>>>+<<<<<<<] \
>>>>>>>-+[[-<+            >]>+<]>[-<<->>]<<[[->+>+<<]>[-<+>]++++++[->- \
------<]+                   >-[-[-[-[--------------[--[<+++[->-------< \
]+>-[--                   [<->>+++++++[-<+++++++++++++>]<++[-]]]]]]]]] \
<<>[-++               ++++[-<------->]+<[-[-[-[-[--------------[--[--- \
------------       --------------[-->-<<<<<<<[->>>>+>+<<<<<]>>>>>[-<<< \
<<+>>>>>]<<<[-       >>>+>+<<<<]>>>>[-<<<<+>>>>]<<<[->>>+>+<<<<]>>>>[- \
<<<<+>>>>]+<-[+[-]        >[-]<]<---[+++[-]>>[-]<<]<-------[+++++++[-] \
>>>[-]<<<]++++++++>>>[-        <<<[-  ]<-<---<<++>>>]]>[-<<+++<+<<[>>> \
-<-]>>[->>]<<+<<--------[>        >>  -<-]>>[->>]<<+<<-[>>>-<-]>>[->>] \
<<<<+++++++++>>+++++++>[->+<]>[       >>>>>+<<<<<[>>+<,[>-]>[>]<[-<<-> \
>]+<+[>-]>[>]<[-<<->>]<->+++++++      ++[-<---------->]+<-[>-]>[>]<[-> \
>>>>++++++++[-<++++++++>]<[->++++<]<  [->+>-<<]>+[-<+>]+>-[<->[-]]<[-< \
[-]<+>>]<<<<]+<--[>-]>[>]<[->>>>+<[>  -<[->>+<<]]>>[-<<+>>]<<->[-<+<-> \
++++++++[->++++++++<]>[-<++++>]<->]<<<<]+++++++++[-<++++++++++>]<++++[ \
-]>>>>  >+<[>-]>[>]<<<[[->>>+<<<]>>[  -]<<]>>>[-<<<+>>>]<<<>>[-<<<<<<[ \
-]<<--  ----->>>>>>]<<<<<<]]>>>>[-]>  [-]<<<]<]>    [-<<<<<[->>+>+<<<] \
>>[-<<                                +>>]<[->        +>>+<<<]>[-<+>]+ \
++++++                                +[->>---        -------------<<] \
>>+[<<                                ++++++++        [->>++++++++++++ \
++++<<                                ]+>>[-]]<      ------[<[-]>+++++ \
+[-]]<                                [->>+<<]++    ++++>+>[-<-<------ \
<+>]>>  ]<]>[-<<<<<[->>+>+<<<]>>[-<<+>>]<[->+>>+<<<]>[-<+>]++++++++[-> \
>-----  -----------<<]>>+[<<++++++++[->>++++++++++++++++<<   ]+>>[-]]< \
-----[  <[-]>+++++[-]]<[->>+<<]+++++>+>[-<-<-----<+>]>>]<]   >[<<<++++ \
>>>->]                                                       <]>[-<<<< \
<[->>+                                                       >+<<<]>>[ \
-<<+>>                                                       ]<[->+>>+ \
<<<]>[                                                       -<+>]>--- \
[<+++>                                                       +++[-]+>[ \
-]>]>[<++   ++++++++++++++[->---   -------------<]>+>+<[<<<+>>++++++++ \
+++++++   +[->++++++++++++++++<]>[   -]>-<]>[-<<<<[-]<--->>>]<]]<]>[<< \
<++>>>   ->]<]>[-<<<<<[->>+>+<<<]>>   [-<<+>>]<[->+>>+<<<]>[-<+>]>-[<+ \
>+[-]+   >[-]>]>[<++++++++++++++++[   ->----------------<]>+>+<[<<<+>> \
++++++   ++++++++++[->+++++++++++++   +++<]>[-]>-<]>[-<<<<[-]<->>>]<]] \
<]<<[[   ->+<]>>+<<]>[-<+>]<<<[[->>   >+<<<]>>>>+<<<<]>>>[-<<<+>>>]+>- \
-[<->+     +[-]]<[-<<[->>+>+<<<]>     >[-<<+>>]<<<<[->>>>+>+<<<<<]>>>> \
[-<<<<+         >>>>]+>----[         -------[<->+++++++++++[-]]]<[-<-< \
[-]+<-[                              >-<[->>+<<]]>>[-<<+>>]<[-<<[-]]]] \
>>>]<[-]>                          ,+[[-<+>]>+<]>[-<<->>]<<]<<<<[<<]<+ \
<<+>>>>>[<<                      <[->>+<<]<[->>+<<]<[->>+<<]<[->>+<<]> \
>>>>>>[-<<<<<                  <+>>>>>>]<[->+<<<<<<<+>>>>>>]+>-------[ \
-[<->++++++++[-]]<[-<<>>+<[>-<[->>+<<]]>>[-<<+>>]<<->[-<+<->++++++++[- \
>++++++++<]>[-<++++>]<->]<<>>]>]<[<<[-<<->>>>>+<<<]<<[[->>+<<]>>>>-<<< \
<]>>>[-<<-<+>>>]<<[[->>+<<]>>>[-]<<<]>>[-<<+>>]<<<[->+>>+<<<]>>[-<<+>> \
]>>>[-<<<+<<+>>>>>]<[-<<<<<+>>>>>]<<>>>++++++++[-<++++++++>]<[->++++<] \
<[->+>-<<]>+[-<+>]+>-[<->[-]]<[-<[-]<+>>]<<<<<[->[-]>[-]>[-<+<+>>]<[-> \
+<]>>[->+<<<+>>]>[-<+>]<<<<<]>>>>>]<<[[->>+<<]>>>+<<<]>>[-<<+>>]<[[->+ \
<]>>+<<]>[-<+>]+>[<->[-]                   ]<<<>>[-<+>>>[>>]>[-]+<<<[< \
<]]>>]<<<<>>+<[>-<[-                           >>+<<]]>>[-<<+>>]<<->[- \
<+<->++++++++[-                                    >++++++++<]>[-<++++ \
>]<->]<<>[>>+<                                       ]>[<]<<[[->>+<<]> \
>>+<<<]>>[-                                            <<+>>]>[[-]<+>] \
<<<>>[->>                                                >[-]+<<<]<[-] \
<[-]<[->+         <]<[->+<]>>>>>>>[-<<<<+>>>>]<<<         <<<<<<[<<]>+ \
>[>>]>>      >[-<[-]<[-]<<<[<<]>->[>>]+++++++++++[->++     ++++>++++++ \
++++>+    ++<<<]>+++.>++++..---.+++.<-----------.>>-.<+++   .-------.- \
------   -----.-.+++++++++++.-----------.+++++++++++++.--   ---------. \
++.-.>  .<--.++++++++++++++++.-----------------.++.+++++++   +.------. \
++++++  +++++++++.-.>+.---[--->+<]>.[-]<<[-]<[-]>>>]<<<<<[   <<]>[<<[- \
[-[-[-  [-[-[[-]>>-<<]>>[-<++++++>]<<]>>[-<+++++>]<<]>>[-<   ++++>]<<] \
>>[-<+   ++>]<<]>[[->+<]>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>   >>>>>]>[>> \
]>[-]>[    -]<++++++++[-<++++>]<[<<]>++++++++[-<++++>]<     -[[-<+<+>> \
]<<<<<<      <<<<<<<<[->>+>>+<<<<]<[->>+>>+<<<<]<[->+>     +<<]+>---[- \
[-[-[<->+         +++[-]]<[->>>>>>>>>>>>+>>-[-[-[         -[-[-[-[-[-[ \
<<->>[-<+>                                               ]<+>]<+>]<+>] \
<+>]<+>]<+>                                            ]<+>]<+>]<+>]<+ \
<[-<<<<++++[-<                                       ++++++++>]<....<[ \
->....<]<[->+++++                                +++++++++++[->....... \
....................                           ....................... \
..............<]<]>>[-]>>>>>]<<<<<<<[-]>[-]>>>>>>+>-[-[-[-[-[-[-[-[-[- \
--------    ----[--[--[-[-----[-[<->+++++++++++++++++++++++++++++++++[ \
-]]<[-+      +++++[->+++++++++++++++++<]>-.+++++++++.----------.[----- \
-----<        +>]<.++++[->++++++++<]>++.+++.-------.+[---<+>]<+++.+[-> \
++<]>+        .+.+[-----<++++>]<.+++++.+++++.[-->+<]>+++++.----------- \
-.----        [-<+++>]<-.+.+[----->++++<]>.+++++++++++.++++++.-.[--<+> \
]<-.-[--    -->+<]>.[-]<]>]<[-+++++[->+++++++<]>.--.-[--<+++>]<-.-[--> \
+++++<]>++.--.-.+[-----<++>]<+.++[->++<]>.+++++++.+++++.[-----<++>]<++ \
+.-[-- >+++++<]>-.+++.-------------------.--[----<+++++>]<+.[--------- \
-->+<]    >-.[-<++++++++++>]<.+.+.[--->+<]>--.---[-<++++>]<--.+++.---- \
---.+[        --->+<]>+++.-----[-<+++>]<.+++++.--------  -------.-[--> \
+<]>--         -.------------.+++++[-<+++>]<.++++++.-.+  [--->+<]>++.- \
[----<            +>]<.[->+++<]>++....++++[-<+++>]<+.+[   -->+<]>+++++ \
+.-[--        <+     ++>]<+.+[-->+<]>++.-[-<++>]<-.-[-->    +<]>----.+ \
+++++.        [--     <+++++>]<.------------------....--[   ----->+++< \
]>-.--        -[-<++    >]<.[-->+<]>+++++.-------------.++  +++++++++. \
+[----        --<+>]<      .[-]]>]<[-++++++++++.[-]]>]<[-+   +++++++++ \
.[-]]>        ]<[-++++     +[->++++++++<]>+.----.+++++++++   ++.[--<++ \
+++>]<        .[----->+      +<]>+.-..[-]++++++++++.[-]<]>   ]<[-+++++ \
[->+++        +++++<]>+.       ----.+++++++++++.[--<+++++>   ]<.[----- \
>++<]>        +.-..[-]+++       +++++++.[-]<]>]<[-++++++[-   >++++++++ \
++++++        ++++<]>+.---        ---------------.+[----<    +++++>]<- \
--.+++        [----->++++<]         >+.[---<++>]<-.----     ---------. \
[---->        +<]>--.[-]<]>          ]<[-++++++[->++++      ++++++++++ \
+++<]>        -.+++++++++.---            -------.[          ---------- \
<+>]<.        [-]]>]<[-++++++[                            ->++++++++++ \
++++++        ++++<]>-.--------                           -------.+.++ \
+.----         ---.--[---<+>]<-.+                       +++[->+++<]>+. \
---------      ---------.+[----<+++                   ++>]<---.+++[--- \
-->++++<]>+.   [---<+>]<++.--[->++<]>              -.-------------.[-- \
--<+>]<--.[-]]>] <[-++++++[->+++++++++++++++++++<]>--.--[-----<++>]<-. \
-[-->+++<]>--.[-]<]>]<[-++++++[->+++++++++++++++++++<]>--.--[-----<++> \
]<+.[--->++++<]>+.[-]<]>]<[-++++++[->++++++++++++++++++<]>+++.++++++.- \
.-[-----<++>]<.++[-->+++++<]>-.-----.---------.+++++++++++.----------- \
----.-[-----<++>]<.------..----[->++<]>..-----[-<++>]<-.-------------- \
----.+[---->+++++<]>---.+++[-----<++++>]<+.-[-->+<]>-----.-[----<+>]<. \
[-]]>]<[-++++++[->++++++++++++++++++<]>+.------------------.+[----<+++ \
++>]<---.+++[----->++++<]>+.[---<++>]<-.-[--->++<]>.----[-<+++>]<+.--- \
---------------.+[---->+++++<]>---.+++[-----<++++>]<+.-[-->+<]>-.[-]<] \
>]<[-++++++[->++++++++++++++++<]>+++.[---<++>]<-----.++[--->+++++<]>.+ \
++++.---------------.-[--<    +>       ]<-.[-->+++++<]>-.------------- \
.----.+++.[-----<++                        >]<.+++++++++.--------.-[-- \
>+++<]>-.----[-<    ++>                         ]<-.------------------ \
.+[---->+++++<    ]>---.                            +++[-----<++++>]<+ \
.[--->++<]>-.  -[---<++   +++                         >]<-.--------.+[ \
-->+<]>++.-        [-<+ +>]<-.[--->                    +<]>+.---[-<+++ \
+>]<+.---   - --      -.--.-------.+++++           +++   ++++++..+[--- \
->+<]>+++.+[  -<++        +>]< .[--->++<]           >--- --..------[-< \
++>]<.----                  - .+++.[-----             ---->+<]>--.[-]< \
]>]<[-+++                    +++[->++++++               ++++++++++++<] \
>+.------                      ---------                 ---.+[----<++ \
+++>]<---.                      +++[---                   -->++++<]>+. \
[---<++>]                <-     .-[---                     >++<]>.---- \
[-<+++>                 ]<+     .----                ---    ---------- \
-.+[--                 -->     ++++ +<]     >         ---.  +++[-----< \
++++>                 ]<+    .-[-- >+<]>---.[-        ]<]< <<<<<<[]>[] \
>[]>                 []>[  ]>[]>[ ]>[]>[]>[]><<         <<<<<<<<<<<<<] \
>]<                   [-> >>>>>> >>   >>>+>>-[           -[-[-[- [-[-[ \
-[-  [<<          ->  >[-< +>]< +>]<+>]<+>]<+               >    ]<+>] \
<+  >]           <+> ]<+>]<+>] <+<[-<<<<++++  [                 -<++++ \
++ ++             >]<....<[-> ..         ..<]                  <[->+++ \
+++           +   +++++++++[ ->...     .....                  ........ \
..          ....  .........   .............                     ...... \
.          ..... ........<      ]<]>>[-]>                        >>>>] \
<         <<<<< <[-]>[-]>                              >>>        >>+> \
-      [ -[-[-[-[-[-[-[-          [------                ---       --- \
-    [-- [--[-[-----[-[            <->+++                 ++++     +++ \
++   +++ +++++++++++++               +++++                 [-]]    <[- \
+++   ++ +++++[->++++     +            ++++ +<       ]      >++    +++ \
.---  .< ++++[-<+++++    +                 ++>]<.   >>-     ---   ---. \
.+++  ++ ++++++++++     .-     --            -------       ---.  +++++ \
++++ +++  .-------     -.-    -----            ..<<--[-   >++<] >+..-[ \
--<+>]<+  +++.>>.     .++++   +++++++  +++       .-------  ---- -.++++ \
++++.++    +++.-     -------  -------. .<<.-      --- [->++ <]>--.<+++ \
++++++     +.[->     ---<]>++ ++....>++++ ++++    ++++ ++++ +++.+++.-- \
-----      .<+++  + ++++.>++++ +.++++++.-- ---    -.<+++ ++ +.>.+.---- \
----  -     ---   - ---.+++++.+++++.<.>++++ .    --------- ----.----.+ \
++.< -      -.>  ++ +++++++++++++.++++++.--  -  ---.<++.>.+. --------- \
------      -.+  ++ ++++++++.+    +++++.-.<. >  +++.-----.---- -----.+ \
+++++       +++  ++ .--------      -------.[ -]  <-----.-[----> +<]>.[ \
-]<]>        ]<  [-  ++++++++      ++[->++++ +++ +++<]>+++++.++  ++.++ \
+.-.+     ++ .++ .+  +++++++++    ++[----<+> ]<.[->++++<]>----    ---- \
-----    .++  ++++.-  -----.<++++++++++.>--  -------------.+.+    .<[- \
<+++>]   <++. >>+++++  +++++++.+++.-------  .< <++++++++.>>----  -.<<+ \
+++.>>   ++++  ++.<<--   -.++++++++++++++  +++  .++[------>+<]> .[-<++ \
+>]<++.  ...>> --.<<[->    ++<]>---.>-    -----  ------------  .<----- \
--------  .>++  .<------.               ++++++.>   ++++++++   ++++++++ \
+++++++++  ++.-  ------------       -----....<++++          +++++++.++ \
>+++++++++  +.[   -]<.-------------.++[----->+<]>.[-      ]<]>]<[-++++ \
++++++.[-]] >]<    [-++++++++++.[-]]>]<[- +++ ++[->+++  +++++<]>+.---- \
.+++++++++++.[-     -<+++++>]<.[----->  ++<]>+  .-..[-  ]<]>]<[-+++++[ \
->++++++++<]>+       .----.+++++++++   ++.[--<  +++++  >]<.[----->++<] \
>+.-..[-]<]>]<        [-+++++++++++   [->++++++   +++ +<]>-.---------- \
--------.++++          +++++++++++   ++++++.----  --- ------------.[-- \
-<++>]<-.---  -        ---------   .[-]++++++++++ .[- ]]>]<[-+++++++++ \
+.[-]]>]<[-+ ++      + +++++++  +[->++++++++++<]> -.- --------------.+ \
.+++.-------.-[      - ------ ---<+++>]<++.--[--- >++  +++++++++<]>-.- \
--------------      -- -.+++ ++++++++++++++++++.----- - -------------. \
---[---<++>]<-      -. [-]++ ++++++++. [-]]>]<[-+++++ ++ +++[->+++++++ \
++++<]>++.----     [-- ----------<+++  ++>]<--.++[---> ++ ++<]>+.[-]<] \
>]<[-++++++++     ++[ ->+++++++++++<   ]>++.----[------ -- ----<+++++> \
]<.[--->++++     <]> +.[-]<]>]<[-+++  +++++++[->++++++++ ++ +<]>+.-[-- \
---------<+     +++ >]<.[ -->+++++<] >-.+++++.+  +++++++ ++. ----[---- \
-------<+++    +>] <.[-- >+++++<]>+++++++++.----  ------- --- ----.+++ \
++++++++++    +++ +++++ .-------------------.--   -[------ --- <++++>] \
<+..-[---   ->+< ]>.[- ]<]>]<[-++++++++++[->++   +++++++++ <]>- .----- \
-------    ----  --.+  ++++++++++++++++++++.    --------- -- --- ----- \
.[---<   ++>]<- .-[-- ->++<]>.[-<+++>]<---   --------.--- --  --- ---- \
---    ---.+++  ++++++++++++++++++.------  -------------  .-  --[ -->+ \
<]>.[-]<]>]<[- ++++++++++[->++++++++++<] >-.<<<++++++++[  ->  +++  ++> \
++++++++<<]>>  ---.>+ +++++.<<.+++++++++.--------.>--.>++ ++  .--  --- \
------------- .+++++++ ++++++++++++++.-------------------. <+ +.>  +++ \
+++.<<------  ---.>>--. +++++++++++++ .----------.<<.>>++++ + +++  +++ \
.+++.------- -------.<<+   +++++++.> >-.<<+.---------.>>++++  ++   +++ \
+++.+++.<<.> >-----.-----           -------------.++++++++++  ++  ++++ \
+++++.------ -------------         .[-]<[-]<[-]>++++++++++.[ -]  ]>]<[ \
-++++++++++[ ->+++++++++++<       ]>-.------------------.++ ++  ++++++ \
+++++++++++. ---------------      ----.[---<++>]<-.-[--->++ <  ]>.[-<+ \
++>]<------- ----.------------   ------.+++++++++++++++++++   ++.----- \
------------ --.---[-->+<]>--.[- ]<]<<<<<<<<<<<<]>]<[->>>>>   >>>>>>>+ \
>>-[-[-[-[-[  -[-[-[-[<<->>[-<+ >]<+>]<+>]<+>]<+>]<+>]<+>]   <+>]<+>]< \
+>]<+<[-<<<<+ +++[-<++++++++>]< ....<[->....<]<[->++++++++   ++++++++[ \
->...........  ............... ..........................   .......... \
..<]<]>>[-]>>> >>]<<<<<<<[-]>[ -]>>>>>>+>-[-[-[-[-[-[-[-   [-[-------- \
-----[--[--[-[  -----[-[<->++ +++++++++++++++++++++++++   ++++++[-]]<[ \
-++++++[->+++++ +++++++++++++ +++<]>-.+[---------<+>]<   ----.[->+++++ \
+++++<]>++.++++  +++++++++++ .-------.-----------.[--   -<+>]<-.++++[- \
>+++<]>+.------- -----.+++++ +++.+++++.+[---<+>]<+++   .+.[->+++<]>.-- \
[-----------<+>]  <-.[->+++ <]>++..---[-<++++>]<--.   +++.-------.+[-- \
->+<]>+++.---[-<+ ++>]<.+++ +.[----->++<]>.----[-<   ++>]<-.-----[-->+ \
++<]>-.----------  ------. +++++.+++++.[-----<++>   ]<.------------.++ \
+++[->+++<]>.++++.  [----- <++>]<.----[->++<]>-.   -----[--<+++>]<-.-- \
--------------.+++  +++++ +++.++++++.-.+[--->+<   ]>++.-[----<+>]<.+++ \
+[->+++++++++<]>-.+  [--- ------<+>]<----.[-]]   >]<[-++++++[->+++++++ \
++++++++++++<]>--.-  --- -----------.++.+++++   +++.----------.++++++. \
--.--[---<+>]<-.++++  [- >+++<]>+.----------   --.++++++++.+++++.[---- \
-------<+>]<.+++[->+  + ++++++<]>+.++++.+++   .-.+++.++.[----<+>]<+++. \
++.+++[->+++<]>.++++.   -[---<+>]<----.-[-   -->+<]>-.[-<++++++++++>]< \
++.+++++++++++++++.--  -----.-----------.   [--->+<]>-.---[-<++++>]<-- \
.+++.-------.+[--->+<] >+++.-----[-<+++>   ]<.+++++.--[--->+<]>----.++ \
++++++++.-----[-<+++>  ]<.++++.[----->+   +<]>.[--<+++>]<+.[-->+++<]>. \
+++.-------.-[--<+>]<  ------.--------   ----.+++++[->+++<]>.++++++.-. \
[----<+>]<+++.+++++++  +++. -----[->+   ++<]>.++++.[-----<++>]<.[-->++ \
+<]>+.[--<+++>]<.+++.   ----  ---.-[-    ---->++<]>+.[-<+++>]<.--[---- \
------->+<]>-.[-<+++>]   <++..--[->+   + ++<]>--.++[-----<++++>]<+.+++ \
++++++++++++++.[--->+<   ]>- -----.+ + + +[-<+++>]<+.----------------- \
-.+[-->+<]>++.[--<+++++  >]    <.----- - ------------....---------.+++ \
++.--[---->+++++<]>+.--  --   -.------ - --------.-[----------<+>]<.[- \
>+++<]>++..--[-<++++>]<   --  .++[---- - >++++<]>+.+++++++++++++++++.[ \
---<+>]<------.----[->++  ++  <]>.[---- < +>]<++++.+++[->+++<]>.+++++. \
++++++.+[---------<+>]<-  --  .[->+++<]> + +..++++[-<+++>]<+.--------- \
---------.+[---->+++++<]  >-- -.+++[-----  <++++>]<+.[--->++<]>-.----- \
--------.[----<+>]<--.[-   ]]>]<[-++++++++ ++.[-]]>]<[-++++++++++.[-]] \
>]<[-++++++++++.[-]]>]<[   -++++++++++.[-]] >]<[-++++++[->++++++++++++ \
++++++<]>+.-------------   -----.+[----<+++ ++>]<---.+++[----->++++<]> \
+.[---<++>]<-.----------   ---.[---->+<]>--  .[-]<]>]<[-++++++[->+++++ \
++++++++++++++++<]>-.+[--  -------<+>]<----  .[-]]>]<[-++++++[->++++++ \
+++++++++++<]>.+++++++++.   +++.[---<+>]<--  ----.++++[->+++<]>+.----- \
-------------.+[----<++++   +>]<---.+++[---  -->++++<]>+.[---<+>]<++.- \
-[->++<]>-.-------------.   [--<+++++>]<+++  .--[----------->+<]>-.[-] \
<]>]<[-++++++[->+++++++++   ++++++++++<]>--  .--[-----<++>]<-.-[-->+++ \
<]>--.[-]<]>]<[-++++++[->+  ++++++++++++++   ++++<]>--.--[-----<++>]<+ \
.[--->++++<]>+.[-]<]>]<[-+   +++++[->+++++  +++++++++++++<]>+++.++++.[ \
-----<++>]<.----[->++<]>-.   -----[--<+++>  ]<-.----------------.+++++ \
++++++.++++++.-.-[----->++   <]>.--[-<++>  ]<-.[--->++++<]>--.-------- \
-.+++++++++++.-------------  --.-[-----<+  +>]<.----[->+++<]>+.------- \
-----------.+[----<+++++>]<  ---.[-->+<]>  ++.--[-<++>]<.--[----->++<] \
>-.++++++.--[-<++>]<-.-[-->  +<]>-----.-  [----<+>]<.[-]]>]<[-++++++[- \
>++++++++++++++++++<]>+.---   ----------  -----.+[----<+++++>]<---.+++ \
[----->++++<]>+.-[--<+>]<-.   [--->++++<  ]>+.[-]<]>]<[-++++++[->+++++ \
+++++++++++++<]>+++.++++.[--  ---<++>]<  .----[->++<]>-.-----[--<+++>] \
<-.----------------.+++++.++   +++.[---  -->++<]>++.-----[-<++>]<.--[- \
--->+++++<]>+.----.+++.[----   -<++>]<.  ----[->+++<]>+.-------------- \
----.+[----<+++++>]<---.[-->+  <]>++.--  [-<++>]<.--[----->++<]>-.++++ \
++.--[-<++>]<-.-[-->+<]>-----   .-[---  -<+>]<.[-]]>]<[-++++++[->+++++ \
+++++++++++++<]>+.-----------   ------  -.+[----<+++++>]<---.+++[----- \
>++++<]>+.-[--<+>]<---.-[-->++  +<]>--  .[-]<]<<<<<<<<<<<<]>]<[->>>>>> \
>>>>>>+>>-[-[-[-[-[-[-[-[-[<<-  >>[-<+  >]<+>]<+>]<+>]<+>]<+>]<+>]<+>] \
<+>]<+>]<+<[-<<<<++++[-<+++++++  +>]<<  [->..<]<[->++++++++++++++++[-> \
...............................  .<]<]  >>[-]>>>>>]<<<<<<<[-]>[-]>>>>> \
>+>-[-[-[-[-[-[-[-[-[----------  ---[- - [--[-[-----[-[<->++++++++++++ \
+++++++++++++++++++++[-]]<[-+++  +++++ + +++++++++++++++++++++++++++++ \
++++++++++++++++++++++++++++++++ ++++++ ++++++++++++++++++++++++++.+++ \
++++++..+++++.---------------. + +++++++ +++++.>++++++++++.[-]<[-]]>]< \
[-+++++++++++++++++++++++++++ +++ ++++++ +++++++++++++++++++++++++++++ \
++++++++++++++++++++++++++++ ++++ ++++++ +.---.----.+++.+.++++++++++++ \
+.>++++++++++.[-]<[-]]>]<[- +++++ +++[->+ ++++<]>+.-[----<+>]<.[-]]>]< \
[-++++++++[->+++++<]>+.-[- ---<+>  ]<.[-]] >]<[-++++++++[->+++++<]>+.- \
[----<+>]<.[-]]>]<[-++++++ ++[->++ +++<]>+. -[----<+>]<.[-]]>]<[-+++++ \
+[->+++++++++++<]>+.++++++ +++.--- ----.---- .+++++++++++++++++.--[--- \
-----<+>]<.[-]]>]<[-++++++ + ++++[ ->++++++<] >+.+++++++++.+++.++++.-- \
------------.+[-------<+>]  < . [- ]]>]<[-+++ +++++[->++++++++++<]>-.+ \
.-----------.+++++++++.++[-  - --  ----<+>]<. [-]]>]<[-++++++++[->++++ \
++++++<]>++.---------.--.+.+  ++   ++++++++ + .----[--<+>]<.[-]]>]<[-+ \
+++++++[->++++++++++<]>----.-    -  ---- - .  +.++++++++++++++.----[-- \
<+>]<.[-]]>]<[-++++++++[->+++++++++  +<]> -  .++++++.-.----.+++++.-.-- \
--[--------<+>]<.[-]]>]<[-++++++++[-  >+++  +++++++<]>+++.++.+++[----< \
+++>]<.-[----->+++<]>+.[----<+>]<-[-]  ]>  ]<[-++++++++[->+++++++++<]> \
+.+++++.++.+++++.-.----[--------<+>]<.    [-]]>]<[-++++++++[->++++++++ \
<]>+.+++..++[--<+>]<+++++.[-]]<<<<<<<<<<<<]>>>>>>>>>>>>>>>><[->+<<+>]+ \
+++>-[<->--[<->--[<->-[<->++++++[-]]]]]<[[-]>>[-<<<<+>>>>]<<<<<<+[->[- \
]>[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<[-]<<<+>>>>-[<<+>>[-< \
<<+>>>]]]]]]]]]]]]<<<[->>>+<<<]>]>[-<<<<+>>>>]<<<[[->>>>+<<<<]>>+[->[- \
]>[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<[-]<<<+>>>>-[<<+>>[-< \
<<+>>>]]]]]]]]]]]]<<<[->>>+<<<]>]<<[>++++++[-<++++++++>]<.[-]]>>++++++ \
[->++++++++<]>.[-]<<<]++++++[-<++++++++>]<.[-]>>>>>>>]>+<<-[-[-[-[-[-[ \
-[-[-[[->+<]>>-<<]>+<]>+<]>+<]>+<]>+<]>+<]>+<]>+<]>+>[++++++++++++++++ \
+++<[->+<<<<<<<<<+>>>>>>>>]<<<<<<<<<+>-------[-[<->++++++++[-]]<[-<<<> \
>+<[>-<[->>+<<]]>>[-<<+>>]<<->[-<+<->++++++++[->++++++++<]>[-<++++>]<- \
>]<<>>>]>]<[-<<<>>>++++++++[-<++++++++>]<[->++++<]<[->+>-<<]>+[-<+>]+> \
-[<->[-]]<[-<[-]<+>>]<<>>>]<<<<[-<<+>>]>[-<<+>>]>[-<<+>>]>>>>>>>>>>]<[ \
-]>>>]]<>>[+--<<<<<<<<++++++++++++++++++++[->+++>++>+++++>+++++>++++++ \
<<<<<]++++++++++>>----->>++++++++++<<.>+++++.>.<------.+>--.+++++++++. \
<.+.<---.+++<.>>>--.+.<-.+++++.>-----.-<<+++++++++++.----------->-.--- \
-<<++.--<.>>>>>>+++++++++[<<<<.>.+.+.+++.>.<----.<---.>.>>>>++++++[-<+ \
+++++++>]<.>++++++[-<-------->]<<<<<++++++++.>>>.<<<+.---------.+++>-> \
>>[->+>+<<]>[-<+>]+>-[-[-[-[-[-[-[-[-[<->[-]]<[-<<<<<+++++++.>>++.--<< \
<+.>++++++.-------------<--.+<.>>>>>>>]>]<[-<<+++++.----->++.-->]>]<[- \
<<-.<<++++.+.>--.++<----.-<+++++.++.>>++.--<<-.------>>>++++.--->+++.- \
-->]>]<[-<<<++.--<<++++++++.--------<+.>>>>.<<<<--.+<.>>>>>>>]>]<[-<<< \
++.--<<++++++++++.----------<+.>>>>.<<<<--.+<.>>>>>>>]>]<[-<<<++.+++++ \
.-.<-.+++++.-------.+++>--.<<+++++.++.>>--.--<<-.------<-.+<.>>>>>>>]> \
]<[-<<<<<+++++++.>>++.--<<+++.----------<+.>>>>.<<<<--.+<.>>>>>>>]>]<[ \
-<<<<-.<<+.>>++++.--.>++++++.<--.+++++.-------.>--.<<+++++.+.<--.>>+++ \
+++++.---.<-.>---.<<+++.-.->++++++++.-------.+.------->>--.--<<<+.>>.+ \
<<--.+<.>>>>>>>]>]<[-<<<<<+++++++.>>++.--<<+.--------<+.>>>>.<<<<--.+< \
.>>>>>>>]><<-]<<<-.+++++.-------.>++++.<<---.>+.>+++.<++++.----------- \
.<<------------.>>>>.<<+++++++++++....---------.<<+++++++++++.<.>>>+++ \
+++++++++.+++++.>-.<<.>-.------------.++++++++.+++++.<++++++++.+.>>>++ \
+.<<<<<.>>>-----------.+++++.-------.>--.<<---------.++++++++++.>>--.< \
<<++.>>+.>+++++.<++++.<<--.<.>>>+++.+++++.>-.<<----------.>----------- \
.<<.<.[-]>[-]>[-]>[-]>[-]>[-]>>>>[<<++++++++++[->++++++++++<]>+.-[--<+ \
>>+<]>--.[-]>[-<<<<<<<+>>>>>>>]<<<----------.+[->>>+<<<]<<<<>>>>+[++++ \
+++++[-<++++++++++>]+<[-<<+<[>-]>[>]<[->>>[-]<<<]<->>>]>[-<+>>+<]<[->+ \
<]>]>[>++++++[-<++++++++>]+<.[-]]<<<<++++++++++[-<++++++++++>]>>>+[<++ \
++++++++[-<<+<[>-]>[>]<[->>>[-]<<<]<->>>]>[-<+>>+<]<[->+<]>]>[>[-]++++ \
++[-<++++++++>]<.[-]]>[+++++[-<++++++++>]<.[-]>]<<<<<++++++++++[-<++++ \
++>]<--.[-]>>>>>>>.[-]++++++++++.---------->]>[-]>[-]++++++++++[->++++ \
+++++++>+++>+++++<<<]>++++.-------------.+++++++++++++++.+.---.----.>+ \
+.>--.+++++++++++.<<+++++++++++++++.>>>++++++++++.[-]<[-]<[-]<[-]<]<<] \
>>[->[>>]>[->>+<<]>[->>+<<]>>>+[-<<[->>+<<]+>[->>+<<]+>>>+<[>-<[->>+<< \
]]>>[-<<+>>]<<->[-<+<->++++++++[->++++++++<]>[-<++++>]<->]<<>[>>+<]>[< \
]<<[[->>+<<]>>>+<<<]>>[-<<+>>]>[[-]<+>]<<<>>]<<+>+>+>+>+>+>+>+[<]>>->- \
>>->->-<<<<<<<>>+++++[->+++++++++++<]<<<<<<[<<]>>[[-<+<<+>>>]>[-<<<+>> \
>]<<>+<-[-[-[-[-[-[-[-[-[[-]>-<]>[->++<]<]>[->>[>>]>>>[[[>]>]>]<<<-<[- \
>>+>>+<<<<]<[->>+>>+<<<<]>>[-<<+>>]>[-<<+>>]<<<[-<<+>>]>[->+<]>[-<++++ \
++++[-<++++++++>]<[->++++<]<[->+>-<<]>+[-<+>]+>-[<->[-]]<[-<[-]<+>>]>> \
]<<+>>>>>>-<<[->>>[>]>>>[>>>]>+<<<<[<<<]<[<]<<]>[->>[>]>>>[>>>]>>+<<<< \
<[<<<]<[<]<]<+>+>+[>]>>>[>>>]>[->>>+<<<]>[->>>+<<<]<<+[[<]<]<->>>[>>>] \
>[-<<<+<[<<<]>+>>[>>>]>]>[-<<<+<<[<<<]>>+>[>>>]>>]<<<<<[<<<]+[>>>]<[-> \
>+<<]<[->>+<<]++++++++++++++++[-<++++++++++++++++>]<--[->+>+<<]+>>>>>+ \
<[>-<[->>+<<]]>>[-<<+>>]<<->[-<+<->++++++++[->++++++++<]>[-<++++>]<->] \
<<[-<<->>]>[->+<]>[-<<+<[>-<[->>+<<]]>>[-<<+>>]<<->[-<+<->++++++++[->+ \
+++++++<]>[-<++++>]<->]>>]<<<<<[<<<]<[<]<<<[[[<]<]<]<<[<<]]<]>[->>[>>] \
>>>[[[>]>]>]<<<->>++++++++[-<<<<>>>++++++++[-<++++++++>]<[->++++<]<[-> \
+>-<<]>+[-<+>]+>-[<->[-]]<[-<[-]<+>>]<<>>>>]<++++++++>+>>->->[>]>>>[>> \
>]+[<<<]<[[[<]<]<]<[[[<]<]<]<<[<<]]<]>[->+++<<+<-[>-]>[>]<[->>--<<]+<- \
[>-]>[>]<[->>-<<]<++>>]<]>[->+++<<+<-[>-]>[>]<[->>--<<]+<-[>-]>[>]<[-> \
>-<<]<++>>]<]>[->++++<]<]>[->+++<<+<-[>-]>[>]<[->>-<<]<+>>]<]>[->+++++ \
+<]<]>[->+++<<+<-[>-]>[>]<[->>-<<]<+>>]<>>[->[>>]>>>[[[>]>]>]<<<-<<>>> \
++++++++[-<++++++++>]<[->++++<]<[->+>-<<]>+[-<+>]+>-[<->[-]]<[-<[-]<+> \
>]<<>>+[[[<]<]<]<<[<<]>]>]+++++++++[>++++++++++++++<-]>+.+[--<+>]<++++ \
+.+++++++.------.>+...++.---........++.--.+++.---.+.-...++++[-<+++>]<+ \
+.[-->+++<]>++.<++++.++++.[-]>--[------->+++<]>--.<...........>.<.++++ \
+[->----<]>.<.+.-.>++++++++.[-].....>.-........++++++++[-<++++++++++++ \
++++>]<.>++++.++++.[-].<.[-]>++++.++++.[-]<++++++[->++++++++++++++<]>> \
>>-<<<[->>>>++++++++[-<++++++++>]<[->++++<]<[->+>-<<]>+[-<+>]+>-[<->[- \
]]<[-<[-]<+>>]<<<]>>.<.<..>>.<.<..+++++.[-]....++++++++++++++++.[-]..> \
>[-]>>>>+<+<+<+<+<+<+<+<<<++++++++++[->++++++++++++++++++++++>++++++++ \
+++++++++++++++++<<<+++++<++++++++++++++++++>>]>>+++++<<<<++++.+++++++ \
+.>>...<-.>>-.<<<-------.>>>>..<<..<<+.>>+++.---...<<++++.>----------- \
----.>...<+++++++++++++++.>>>.<<<.>>++++++++++++++++++.<<<++++++++++++ \
+++.>>>>-[--<<+>>]<<+.+++++++++.<<-----------.>+[->>>+++<<<]>>>+.<++++ \
+++++++++++.---------.>+++++++++++++++++++.<<.<<+++++++++++++++.>>.<<- \
-------------.>>+[--<+>]<--.++[->++<]>-.<++++[-<+++++>]<+++.>>.<<+++++ \
.>>+++[--<+>]<+..-[->++<]>---.>+++++++++++.<+++[--<+>]<.-..<[-]>[-]>>[ \
-]>[-]+<+<+<+<<<[<<]>>[<+>-[-[-[-[-[-[-[-[-[[-]<->]<[-+++++++++++[->++ \
+++>++++++++++++<<]>>++++.[-]<++.[-]<]>]<[-+++++++[->++++++++<]>++.-.+ \
++[----<+>]<.[->+++++++++<]>--.[-]>>[>>]>[>]+>+>+>->>.[-]<.[-]++++++++ \
+++++++++[-<+++++++++++++++>]<..[-]<[<]<<[<<]<]>]<[-+++++++[->++++++++ \
<]>++.-.+++[---->+<]>.[-<+++++++++>]<---.[-]>>[>>]>[>]+>+>+>->>.[-]<.[ \
-]..<<[<]<<[<<]<]>]<[->+>-[-[<+++++++++[-<+++++++++++++>]<+.>++++++[-< \
++++++++++>]<++.[-]>>++.[-]]<[.++++++++++++[->++++++++++++++++++<]>-.[ \
-]<]>]<[++++[->+++++++++++++<]>.[-]<]<]>]<[->+>-[-[<+++++++++[-<++++++ \
+++++++>]<+.>++++++++++[-<++++++++++>]<++.[-]>>++.[-]]<[++++[->+++++++ \
+<]>+.+++++[-<+++++>]<+++.[-]]>]<[+++++++[->+++++++++<]>+.[-]<]<]>]<[- \
++++++++++[->+++++++++++++<]>+++++++.+[------<++++++++++>]<++++++++++. \
[------>+++++<]>+++++.-----[-----<+++>]<++++++++.[-]]>]<[->+>-[<-]<[<] \
++++[-<++++>]<[->++++++++<]+>>[-<<->-[->++<]>.[-]+++++++++.[-]]<<[->.+ \
+[------------->++++<]>+.[-]>+.[-]<<<]>]>]<[-++++++++++[->++++++++++++ \
++<]>---.+++[-----<+++++++++>]<----.++[---------->+++<]>.+++++++[--<++ \
+++>]<.[-]+++++[->+++++<]>[-<+++++>]<+++.++++++++[-------->++++<]>-.[- \
]<]>]<[->+>-[<-]<[<]++++[-<++++>]<[->++++++++<]+>>[-<<->-[->++<]>.[-]+ \
.-]<<[>.[-]<.>>>+.[-]<<<-]>]>>>]<++++++++++[->++++++++++++++<]>---.+++ \
[-------<+++++++++++>]<----.>++++++++[-<++++>]<++[---------->+++<]>.++ \
+++++[--<+++++>]<.[-]+++++[->+++++<]>[-<+++++>]<+++.[-]<]<<]]";
#if 0/*[
O0=($(echo "$KK"|sed -e"s/\(.\)/\\1 /g"));OO=($(for((i=0;i<65535;i++))
do echo "0";done));Oo=0;oo="";oO=0;o0=0;while [ $oO -lt ${#O0[@]} ];do
case ${O0[$oO]} in ">")o0=$((o0+1));;"<")o0=$((o0-1));;"+")OO[$o0]=$((
(${OO[$o0]}+1)%0x100));;"-")OO[$o0]=$(((${OO[$o0]}+0377)%0x100));;".")
echo -ne "\0$(((${OO[$o0]}/64)%8))""$(((${OO[o0]}/8)%8))$((${OO[o0]}%8
))";;",")if ((${#oo}==0)); then oo=$(cat);fi;if ((${#oo}>0)); then OO[
$o0]=$(printf "%d" "'${oo:0:1}");oo=${oo:1};fi;;"[")if ((${OO[$o0]}==0
));then c=1;while (($c>0));do oO=$(($oO+1));if [  ${O0[$oO]} == \[ ] ;
then c=$((c+1));fi;if [ ${O0[$oO]} == \] ]; then ((c-- ));fi;done;else
O0O[$Oo]=$oO;((Oo++)); fi;;"]")((Oo--));if ((${OO[$o0]})); then oO=$((
${O0O[$Oo]}-1));fi;;esac;((oO++));done;
#]*/
#endif

