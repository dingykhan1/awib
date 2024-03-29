
For debug and development purposes only

A lang_generic dummy language definition which for S outputs the name of
the corresponding code block
% (stuff) *D d 7(0) S (stuff)
% where integer S indicates which code block to output
%       16 b integer Dd is loop depth

# indentation if S le 13: 2*add(D*256 d) blank spaces
>>>>>>>+>>
-[-[-[-[-[-[-[-[-[-[-[-[-[<<->>[-<+>]]
<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+>]<+<
% D d 0 0 0 0 0 *c S 0    (where c == S le 13 ? 1 : 0)
[-<<<<++++[-<++++++++>]<<[->..<]
<[->++++++++++++++++[->................................<]<]>>[-]>>>>>]
<<<<<<<[-]>[-]>>>>>>
% (stuff) 7(0) *0 S 0 (stuff)

+>-[-[-[-[-[-[-[-[-[-[-[-[-[--------[--[--[-[---[--[--[---[-
[<->++++++++++++++++++++++++++++++++++++++[-]]

<[-
# footer
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+++++++++..+++++.---------------.+++++++++++++.>++++++++++.[-]<[-]
]>]

<[-
# header
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.---.----.+++.+.+++++++++++++.>++++++++++.[-]<[-]
]>]

<[-
# ')\n'  (matches RMUL2)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches LMUL2)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches SET)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches RIGHT)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches LEFT)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches SUB)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# ')\n'  (matches ADD)
++++++++[->+++++<]>+.-[----<+>]<.[-]
]>]

<[-
# 0x2c   (comma for RMUL)
++++[->+++++++++++<]>.[-]<
]>]

<[-
# RMUL(
++++++[->++++++++++++++<]>--.-----.++++++++.---------.[--<+>]<++.[-]
]>]

<[-
# 0x2c   (comma for LMUL)
++++[->+++++++++++<]>.[-]<
]>]

<[-
# LMUL(
+++++[->+++++++++++++++<]>+.+.++++++++.---------.[--<+>]<++.[-]
]>]

<[-
# SET\n
++++++[->++++++++++++++<]>-.--------------.+++++++++++++++.[--<+>]<--.[-]
]>]

<[-
# CLOSE\n
+++++++++++[->++++++<]>+.+++++++++.+++.++++.--------------.+[-------<+>]<.[-]
]>]

<[-
# OPEN\n
++++++++[->++++++++++<]>-.+.-----------.+++++++++.++[--------<+>]<.[-]
]>]

<[-
# RIGHT(
++++++++[->++++++++++<]>++.---------.--.+.++++++++++++.----[--<+>]<.[-]
]>]

<[-
# LEFT(
++++++++[->++++++++++<]>----.-------.+.++++++++++++++.----[--<+>]<.[-]
]>]

<[-
# OUTPUT
++++++++[->++++++++++<]>-.++++++.-.----.+++++.-.----[--------<+>]<.[-]
]>]

<[-
# SUB(
++++++++[->++++++++++<]>+++.++.+++[----<+++>]<.-[----->+++<]>+.[----<+>]<-[-]
]>]

<[-
# INPUT
++++++++[->+++++++++<]>+.+++++.++.+++++.-.----[--------<+>]<.[-]
]>]

<[-
# ADD(
++++++++[->++++++++<]>+.+++..++[--<+>]<+++++.[-]
]<<<<<<<

% (stuff) *0 9(0) (stuff)
