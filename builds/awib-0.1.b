[
== About

Also Written In Brainfuck (awib) is an optimizing brainfuck
compiler, 100% written in brainfuck. Awib reads brainfuck source
code as input and writes compiled programs as output. Awib is
a cross-compiler with several different target platforms available.


== Requirements

Awib will run smoothly in any brainfuck environment where:

   o) Cells are 8-bit or larger

   o) The read instruction ',' (comma) issued after end of
      input results in 0 being written OR -1 being written
      OR no change being made to the cell at all.

The vast majority of brainfuck environments meet these criteria.


== Environment

Code compiled with awib will execute in an environment where:

   o) Cells are 8-bit wrapping integers.

   o) Issuing the read instruction ',' (comma) after
      end of input results in the current cell being
      left as is  (no-change on EOF).

   o) At least 2^16-1 = 65535 cells are available.

   o) Operating beyond the available memory, in either
      direction, results in undefined behaviour.


== Usage

Run awib in your brainfuck environment of choice. Feed brainfuck
source code to awib as input and the compiled program will be
written as output.

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
       Table 1 - Available target platforms


== Optimizations

Awib is an optimizing compiler:

 o) Sequences of '-','<','>' and '+' are contracted into single
    instructions. E.g. "----" is replaced with a single ADD(4).

 o) Mutually cancelling instructions are reduced. E.g. "+++--<>>"
    is equivalent to "+>" and is compiled accordingly.

 o) Some common constructs are identified and replaced with single
    instructions. E.g. "[-]" is compiled into a single CLEAR-
    instruction.

 o) Loops known to never be entered are removed. This is the case
    for loops opened at the very beginning of a program (when all
    cells are 0) and loops opened immediately after the closing
    of another loop.

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


Mats Linander 2008-11-01
matslina (at) gmail (d0t) com
]

>>>>>>>++>>>>+[>,[->+>+<<]>>[-<<+>>]+<+[-[>+++++[-<------->]+<-[-[-[-[
--------------[--[-->>+<<[>>-<++[-<--------->]+<[--[>+++++++++[-<+++++
+++++>]<[-]]]]]          ]]]]]]]>[-<<<->>>]<<<]>>>>[->++++++++++++++++
++++<<<<[-]>>              >+[-<,+[-<+<+>>]+<<->[-[---------[-[---[>++
++[-<---->]+                <+[-----------[-[-[-[--------------[--[>++
[-<--------      ->]+<-      -[--[>+++++++++[-<++++++++++>]<[-]]]]]]]]
]]]]]]]+>[      -<->]>>[      ->+<]<<<[->>>+>->+<[>-]>[>]<[-<<->>]<<<<
<]>>>]+>[      <-]<[<]>[-      <<<,>>>>]<<<<+[->+<]>[-<<[<]<<<+>>>>[>]
>]++++++      ++++++++++++      ++>>>>[-<<<<->>>>]<<<+++<<<[<]<<<->>>>
[>]>>[[      ->+>+<<]>[-<+>      ]+>-[-[-[<->[-]]<[->>+++++++[->++++++
+<]+++      +++++++++++>[->+      +>++>++>++>++>++>++>++>++>++>++>++>+
+>++<                              <<<<<<<<<<<<<]>++++++++++>->+++++++
+++++                              >+++++>--->>++++++++++++++++>->++++
+++>+      +++++++++++>++++>+      ++++++++++++++++++>+>+++++++++<<<<<
<<<<<      <<<<<<<]>]<[->>+++      ++++[->+++++++<]++++++>[->++>++>++>
++>++      >++<<<<<<]>+++++++      +++>->++++++++++++>+++++>--->+<<<<<
<<<<]      >]<[->>+++++++[->+      ++++++<]+++++++++>[->+>+>+>++>++>++
>++>+      +>++<<<<<<<<<]>++>      +++++++>+++++>--->++++++++++>++++++
+>+++      +++++++++>++++++++      +++++++++++>++++++++++++++++++++++<
<<<<<      <<<<<<]<<[->>+>>-<      <<<]>>[-<<+>>]>+>[<++++[->++++<]>[-
]]<          [-<+<<<<[<]>[[-          <+<+>>]<[>>[>]>>>>>[>]>+>[<-]<[<
]>[-<<[<]<[-]<<<<[<]<[-]+>>[>]>>>>>[>]>>+<]>-<<<[<]<<<<<[<]<-]>>[>]>>>
>>[          >]>>[[-]<<<[<]<          [-]>>[>]>>]<<+      [<]<<<<<[<]>
]<<<[      [->>+<<]<]>>>[>]>>>      >>[>]     <[-<]<[     -<<<<[<]<<<<
[-]>>      >>>[>]>>[-<<<[<]<<<      <+>>       >>>[>]     >>]+>]>]>>>[
>]<[[      -]<]<<<<-]<[-]<<[[-      ]<]<       <<+[->     >>>+<<<<]>>>
>->>>      ]<<<+[->>>>>>>+<<<<      <<<]>     >>>>>>-     +[[-<+>]>+<]
>[-<<      ->>]<<[[->+>+<<]>[-      <+>]++++++[->----     ---<]+>-[-[-
[-[--      ------------[--[<++      +[-        >-----     --<]+>-[--[<
->>++      +++++[-<+++++++++++      ++>]<      ++[-]]     ]]]]]]]<<>[-
+++++      +[-<------->]+<[-[-      [-[-[      ------            -----
---[-      -[-----------------      -----      ------             -[--
>-<<<      <<<<[->>>>+>+<<<<<]      >>>>>      [-<<<<     <+>>>    >>]
<<<[-      >>>+>+<<<<]>>>>[-<<      <<+>>      >>]<<<     [->>>+    >+
<<<<]>      >>>[-<<<<+>>>>]+<      -[+[-]      >[-]<]     <---[+    ++
[-]>>[-      ]<<         ]<-      ------[      ++++++     +[-]>>    >[
-]<<<]++      +     +     +      +++>>>[-      <<<[-]     <-<---    <<
++>>>]]>[-         <<+         ++<+<<[>>>      -<-]>>     [->>]     <<
+<<--------[      >>>-<      -]>>[->>]           <<+               <<-
[>>>-<-]>>[->>]<<<<+++++++++>>+++++++>[->+<]>[>>>>>+<<<<<[>>+<,[>-]>[>
]<[-<<->>]+<+[>-]>[>]<[-<<->>]<->+++++++++[-<---------->]+<-[>-]>[>]<[
->>>>>++++++++[-<++++++++>]<[->++++<]<[->+>-<<]>+[-<+>]+>-[<->[-]]<[-<
[-]<+>>]<<<<]+<--[>-]>[>]<    [-       >>>>+<[>-<[->>+<<]]>>[-<<+>>]<<
->[-<+<->++++++++[-                        >++++++++<]>[-<++++>]<->]<<
<<]+++++++++[-<+    +++                         ++++++>]<++++[-]>>>>>+
<[>-]>[>]<<<[[    ->>>+<                            <<]>>[-]<<]>>>[-<<
<+>>>]<<<>>[-  <<<<<<[-   ]<<                         ------->>>>>>]<<
<<<<]]>>>>[        -]>[ -]<<<]<]>[-                    <<<<<[->>+>+<<<
]>>[-<<+>   > ]<      [->+>>+<<<]>[-<+>]           +++   +++++[->>----
------------  <<]>        >+[< <++++++++[           ->>+ +++++++++++++
++<<]+>>[-                  ] ]<------[<[             -]>++++++[-]]<[-
>>+<<]+++                    +++>+>[-<-<-               -----<+>]>>]<]
>[-<<<<<[                      ->>+>+<<<                 ]>>[-<<+>>]<[
->+>>+<<<]                      >[-<+>]                   ++++++++[->>
---------                --     -----<                     <]>>+[<<+++
+++++[-                 >>+     +++++                +++    +++++++<<]
+>>[-]                 ]<-     ---- [<[     -         ]>++  +++[-]]<[-
>>+<<                 ]++    +++>+ >[-<-<-----        <+>] >>]<]>[<<<+
+++>                 >>->  ]<]>[- <<<<<[->>+>+<         <<]>>[-<<+>>]<
[->                   +>> +<<<]> [-   <+>]>---           [<+++>+ ++[-]
+>[  -]>          ]>  [<++ ++++ ++++++++++[->               -    -----
--  --           --- ---<]>+>+ <[<<<+>>+++++  +                 ++++++
++ ++             [->++++++++ ++         ++++                  ++<]>[-
]>-           <   ]>[-<<<<[- ]<---     >>>]<                  ]]<]>[<<
<+          +>>>  ->]<]>[-<   <<<<[->>+>+<<                     <]>>[-
<          <+>>] <[->+>>+<      <<]>[-<+>                        ]>-[<
+         >+[-] +>[-]>]>[                              <++        ++++
+      + ++++++++[->----          -------                ---       --<
]    >+> +<[<<<+>>+++++            ++++++                 ++++     +[-
>+   +++ ++++++++++++<               ]>[-]                 >-<]    >[-
<<<   <[ -]<->>>]<]]<     ]            <<[[ ->       +      <]>    >+<
<]>[  -< +>]<<<[[->>>    +                 <<<]>>   >>+     <<<   <]>>
>[-<  << +>>>]+>--[     <-     >+            +[-]]<[       -<<[  ->>+>
+<<< ]>>  [-<<+>>]     <<<    <[->>            >>+>+<<<   <<]>> >>[-<<
<<+>>>>]  +>----[     -----   --[<->+  +++       +++++++[  -]]] <[-<-<
[-]+<-[    >-<[-     >>+<<]]  >>[-<<+> >]<[-      <<[ -]]]] >>>]<[-]>,
+[[-<+     >]>+<     ]>[-<<-> >]<<]<<<<[< <]<+    <<+> >>>> [<<<[->>+<
<]<[-      >>+<<  ] <[->>+<<]< [->>+<<]>>> >>>    >[-<<< << <+>>>>>>]<
[->+  <     <<<   < <<+>>>>>>]+>-------[-[< -    >++++++++ [-]]<[-<<>>
+<[> -      <[-  >> +<<]]>>[-<<+>>]<<->[-<+  <  ->++++++++[- >++++++++
<]>[-<      +++  +> ]<->]<<>>]    >]<[<<[-<< -  >>>>>+<<<]<<[[ ->>+<<]
>>>>-       <<<  <] >>>[-<<-<      +>>>]<<[[ ->  >+<<]>>>[-]<<< ]>>[-<
<+>>]        <<  <[  ->+>>+<<      <]>>[-<<+ >>] >>>[-<<<+<<+>>  >>>]<
[-<<<     << +>> >>  >]<<>>>++    ++++++[-<+ +++++++>]<[->++++    <]<[
->+>-    <<]  >+[-<+  >]+>-[<->[-]]<[-<[-]<  +>>]<<<<<[->[-]>[    -]>[
-<+<+>   >]<[ ->+<]>>  [->+<<<+>>]>[-<+>]<  << <<]>>>>>]<<[[->>  +<<]>
>>+<<<   ]>>[  -<<+>>]   <[[->+<]>>+<<]>[  -<+  >]+>[<->[-]]<<< >>[-<+
>>>[>>]  >[-]+ <<<[<<]]    >>]<<<<>>+<    [>-<[  ->>+<<]]>>[-  <<+>>]<
<->[-<+<  ->++  ++++++[->               ++++++++   <]>[-<++   ++>]<->]
<<>[>>+<]  >[<]  <<[[->>+<<]>       >>+<<<]>>[-<<+          >>]>[[-]<+
>]<<<>>[->  >>[   -]+<<<]<[-]<[-]<[->+<]<[->+<]>>>>>      >>[-<<<<+>>>
>]<<<<<<<<< [<<    ]>+>[>>]>>>[-<<<[<<]>- >[> >]++++++  +++++[->++++++
>++++++++++>+++     <<<]>+++.>++++..--  -.+++.  <-----  ------.>>-.<++
+.-------.----       --------.-.++++   +++++++  .----  -------.+++++++
++++++.-------        ----.++.-.>.<   --.++++++   +++ +++++++.--------
---------.++.          ++++++++.--   ----.++++++  +++ ++++++.-.>+.---[
--->+<]>.[-]  <        <[-]<[-]>   ]<<<<<[<<]>[<< [-[ -[[-]>>-<<]>>[->
<<<<<<<<<+++ ++      + +++++++  +++++++[->+++>++> +++ ++>+++++>++++++<
<<<<]++++++++++      > >----- >>++++++++++<<.>+++ ++.  >.<------.+>--.
+++++++++.<.+.      <- --.++ +<.>>>--.+.<-.+++++.>--- - -.-<<+++++++++
++.-----------      >- .---- <<++.--<. >>>>>>++++++++ +[ <<<<.>.+.+.++
+.>.<----.<---     .>. >>>>++++++[-<+  +++++++>]<.>+++ ++ +[-<--------
>]<<<<<++++++     ++. >>>.<<<+.-----   ----.+++>->>>[-> +> +<<]>[-<+>]
+>-[-[-[-[-[     -[- [-[-[<->[-]]<[-  <<<<<+++++++.>>++. -- <<<+.>++++
++.--------     --- --<-- .+<.>>>>>> >]>]<[-<<+  ++++.-- --- >++.-->]>
]<[-<<-.<<+    +++ .+.>- -.++<----.-<+++++.++.>>  ++.--<< -.- ----->>>
++++.--->+    ++. --->] >]<[-<<<++.--<<++++++++   .------- -<+ .>>>>.<
<<<--.+<.   >>>> >>>]> ]<[-<<<++.--<<+++++++++   +.------- ---< +.>>>>
.<<<<--    .+<.  >>>>  >>>]>]<[-<<<++.+++++.    -.<-.++++ +. --- ----.
+++>--   .<<+++ ++.++ .>>--.--<<-.------<-   .+<.>>>>>>>] >]  <[- <<<<
<++    +++++.>  >++.--<<+++.----------<+.  >>>>.<<<<--.+  <.  >>> >>>>
]>]<[-<<<<-.<< +.>>++++.--.>++++++.<--.+ ++++.-------.>-  -.  <<+  +++
+.+.<--.>>+++  +++++. ---.<-.>---.<<+++.-.->++++++++.---- --  -.+  .--
----->>--.--< <<+.>>.+ <<--.+<.>>>>>>>]>]<[-<<<<<+++++++.> >+ +.-  -<<
+.--------<+  .>>>>.<<< <--.+<.>>>>>> >]><<-]<<<-.+++++.--- - ---  .>+
+++.<<---.>+ .>+++.<++++   .-------- ---.<<------------.>>>>  .<   <++
+++++++++... .---------.<           <+++++++++++.<.>>>++++++  ++  ++++
.+++++.>-.<< .>-.---------         ---.++++++++.+++++.<+++++ ++  +.+.>
>>+++.<<<<<. >>>-----------       .+++++.-------.>--.<<---- --  ---.++
++++++++.>>- -.<<<++.>>+.>++      +++.<++++.<<--.<.>>>+++.+ +  +++.>-.
<<---------- .>-----------.<<.   <.[-]>[-]>[-]>[-]>[-]>[-]>   >>>[<<++
++++++++[->+ +++++++++<]>+.-[--< +>>+<]>--.[-]>[-<<<<<<<+>>   >>>>>]<<
<----------.  +[->>>+<<<]<<<<>> >>+[+++++++++[-<++++++++++   >]+<[-<<+
<[>-]>[>]<[-> >>[-]<<<]<->>>]>[ -<+>>+<]<[->+<]>]>[>++++++   [-<++++++
++>]+<.[-]]<<  <<++++++++++[-< ++++++++++>]>>>+[<++++++++   ++[-<<+<[>
-]>[>]<[->>>[- ]<<<]<->>>]>[-< +>>+<]<[->+<]>]>[>[-]++++   ++[-<++++++
++>]<.[-]]>[++  +++[-<+++++++ +>]<.[-]>]<<<<<++++++++++   [-<++++++>]<
--.[-]>>>>>>>.[ -]++++++++++. ---------->]>[-]>[-]++++   ++++++[->++++
+++++++>+++>+++  ++<<<]>++++ .-------------.+++++++++   ++++++.+.---.-
---.>++.>--.++++ +++++++.<<+ ++++++++++++++.>>>+++++   +++++.[-]<[-]<[
-]<[-]<]<<]>>[->  [>>]>[->> +<<]>[->>+<<]>>>+[-<<[-   >>+<<]+>[->>+<<]
+>>>+<[>-<[->>+<< ]]>>[-<<+ >>]<<->[-<+<->++++++++   [->++++++++<]>[-<
++++>]<->]<<>[>>+  <]>[<]< <[[->>+<<]>>>+<<<]>>[-   <<+>>]>[[-]<+>]<<<
>>]<<+>+>+>+>+>+>+  >+[<]> >->->>->->-<<<<<<<>>+   ++++[->+++++++++++<
]<<<<<<[<<]>>[[-<+  <<+>> >]>[-<<<+>>>]<<>+<-[-   [-[-[-[-[-[-[-[[-]>-
<]>[->++<]<]>[->>[>  >]>> >[[[>]>]>]<<<-<[->>+   >>+<<<<]<[->>+>>+<<<<
]>>[-<<+>>]>[-<<+>>  ]<< <[-<<+>>]>[->+<]>[-<   ++++++++[-<++++++++>]<
[->++++<]<[->+>-<<]>  +[ -<+>]+>-[<->[-]]<[-   <[-]<+>>]>>]<<+>>>>>>-<
<[->>>[>]>>>[>>>]>+<  < <<[<<<]<[<]<<]>[->>   [>]>>>[>>>]>>+<<<<<[<<<]
<[<]<]<+>+>+[>]>>>[>>   >]>[->>>+<<<]>[->>   >+<<<]<<+[[<]<]<->>>[>>>]
>[-<<<+<[<<<]>+>>[>>>  ]>]>[-<<<+<<[<<<]>   >+>[>>>]>>]<<<<<[<<<]+[>>>
]<[->>+<<]<[->>+<<]+++ +++++++++++++[-<+   +++++++++++++++>]<--[->+>+<
<]+>>>>>+<[>-<[->>+<<  ]]>>[-<<+>>]<<->   [-<+<->++++++++[->++++++++<]
>[-<++++>]<->]<<[-<<-  >>]>[->+<]>[-<<   +<[>-<[->>+<<]]>>[-<<+>>]<<->
[-<+<->++++++++[->+++  ++++ +<]>[-<++   ++>]<->]>>]<<<<<[<<<]<[<]<<<[[
[<]<]<]<<[<<]]<]>[->>   [>>]  >>>[[[>    ]>]>]<<<->>+++++++[-<<<<>>>++
++++++[-<++++++++>]<[-   >++++<]<[->   + >-<<]>+[-<+>]+>-[<->[-]]<[-<[
-]<+>>]<<>>>>]<+++++++   >+> >->->[> ] > >>[>>>]+[<<<]<[[[<]<]<]<[[[<]
<]<]<<[<<]]<]>[->+++<<+  <-    [>-]>[> ] <[->>--<<]+<-[>-]>[>]<[->>-<<
]<++>>]<]>[->+++<<+<-[>  -]   >[>]<[-> > --<<]+<-[>-]>[>]<[->>-<<]<++>
>]<]>[->++++<]<]>[->+++   <<  +<-[>-]> [ >]<[->>-<<]<+>>]<]>[->++++++<
]<]>[->+++<<+<-[>-]>[>]<  [-  >>-<<]<+> > ]<>>[->[>>]>>>[[[>]>]>]<<<-<
<>>>++++++++[-<++++++++>  ]<  [->++++<]< [ ->+>-<<]>+[-<+>]+>-[<->[-]]
<[-<[-]<+>>]<<>>+[[[<]<]  <]< <[<<]>]>]++  +++++++[>++++++++++++++<-]>
+.+[--<+>]<+++++.+++++++   .------.>+...++ .---........++.--.+++.---.+
.-...++++[-<+++>]<++.>..   .++++++++[-<---- >]<.>...........<.>.+++++[
-<---->]<.>.+.-.<+++++++   +.[-].....>>>.-. ..............<++++++[->++
++++++++++++<]>>>>-<<<[-   >>>>++++++++[-<+  +++++++>]<[->++++<]<[->+>
-<<]>+[-<+>]+>-[<->[-]]<[  -<[-]<+>>]<<<]>>  .<.<..>>.<.<..+++++++.[-]
.......>[-]>[-]>>>>+<+<+<   +<+<+<+<+<<<+++  +++++++[->+++++++++++++++
+++++++>+++++++++++++++++   ++++++++<<<++++  +<++++++++++++++++++>>]>>
+++++<<<<++++.++++++++.>>   ...<-.>>-.<<<--  -----.>>>>..<<..<<+.>>+++
.---...<<++++.>----------   -----.>...<++++  +++++++++++.>>>.<<<.>>+++
+++++++++++++++.<<<+++++++  ++++++++.>>>>-   [--<<+>>]<<+.+++++++++.<<
-----------.>+[->>>+++<<<]   >>>+.<+++++++  ++++++++.---------.>++++++
+++++++++++++.<<.<<+++++++   ++++++++.>>.<  <--------------.>>+[--<+>]
<--.++[->++<]>-.<++++[-<++   +++>]<+++.>>  .<<+++++.>>+++[--<+>]<+..-[
->++<]>---.>+++++++++++.<++  +[--<+>]<.-.  .<[-]>[-]>>[-]>[-]+<+<+<+<<
<[<<]>>[<+>-[-[-[-[-[-[-[-[  -[[-]<->]<[-  +++++++++++[->+++++>+++++++
+++++<<]>>++++.[-]<++.[-]<]  >]<[-++++++  +[->++++++++<]>++.-.------[-
>++<]>.<+++[-<+++++>]<.[->>   ++<<]>>+.[  -]>[>>]>[>]+>+>+>->>.[-]<.[-
]<<[<]<<[<<]<]>]<[-+++++++[   ->++++++++  <]>++.-.------[->++<]>.<+++[
-<+++++>]<.[->>++<<]>>.[-]>[  >>]>[>]+>  +>+>->>.[-]<.[-]<<[<]<<[<<]<]
>]<[->+>-[-[<+++++++++[-<+++   ++++++++  ++>]<+.>++++++[-<++++++++++>]
<++.[-]>>++.[-]]<[.+++++++++   +++[->++  ++++++++++++++++<]>-.[-]<]>]<
[++++[->+++++++++++++<]>.[-]<  ]<]>]<[-  >+>-[-[<+++++++++[-<+++++++++
++++>]<+.>++++++++++[-<++++++   ++++>]  <++.[-]>>++.[-]]<[++++[->+++++
+++<]>+.+++++[-<+++++>]<+++.[   -]]>]<  [+++++++[->+++++++++<]>+.[-]<]
<]>]<[-++++++++++[->++++++++++  +++<]>  +++++++.+[------<++++++++++>]<
++++++++++.[------>+++++<]>+++  ++.---  --[-----<+++>]<++++++++.[-]]>]
<[->+>-[<-]<[<]++++[-<++++>]<[-  >++++  ++++<]+>>[-<<->-[->++<]>.[-]++
+++++++.[-]]<<[->.++[----------  --->+  +++<]>+.[-]>+.[-]<<<]>]>]<[-++
++++++++[->++++++++++++++<]>---  .+++[ - ----<+++++++++>]<----.++[----
------>+++<]>.+++++++[--<+++++>  ]<.[- ] +++++[->+++++<]>[-<+++++>]<++
+.++++++++[-------->++++<]>-.[-] <]>]<[ ->+>-[<-]<[<]++++[-<++++>]<[->
++++++++<]+>>[-<<->-[->++<]>.[ - ]+.-]<< [>.[-]<.>>>+.[-]<<<-]>]>>>]<+
+++++++++[->++++++++++++++<]> --- .+++[- ------<+++++++++++>]<----.>++
++++++[-<++++>]<++[--------- ->++ +<]>.+ ++++++[--<+++++>]<.[-]+++++[-
>+++++<]>[-<+++++>]<+++.[-] <]<<] ]
