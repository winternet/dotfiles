
Custom Mappings
---------------

Mapping    |  Description                                                                           |   Depends on
-----------|----------------------------------------------------------------------------------------|-----------------------
Ctrl-n     |  search files                                                                          |   fzf, awk
Ctrl-f     | search contents                                                                        | silver-searcher (Ag)
gd         | goto definition                                                                        | coc
gy         | goto type definition                                                                   | coc
gi         | goto implementation                                                                    | coc
gw         | goto references                                                                        | coc
<leader>rn | rename                                                                                 | coc
<A-F6>     | rename                                                                                 | coc
<leader>f  | format                                                                                 | coc
<A-F7>     | callers                                                                                | coc

Surrounding
-----------

Example             |   Command     |   Result
--------------------|---------------|-----------------------------
"Hello World"       |   cs"'        |   'Hello World'
'Hello World'       |   cs'&lt;q&gt;      |   &lt;q&gt;Hello World&lt;/q&gt;
&lt;q&gt;Hello World&lt;/q&gt;  |   dst         |   Hello World
'Hello World'       |   ds'         |   Hello World
Hello World         |   ysiw&lt;em&gt;    |    &lt;em&gt;Hello&lt;/em&gt; World
_Hello World        |   ys2w"       |   "Hello World"

In visual mode

    Hello World             S<p>

    <p>
        Hello World
    </p>

Unimpaired
----------

Command             | Alias         | Description
--------------------|---------------|-------
]q                  | :cnext        | next quickfix 
[q                  | :cprevious    | previous quickfix 
]&lt;space&gt;      |               | insert empty line below current line
]&lt;space&gt;      |               | insert empty line above current line

Searching
---------

Command   | Description
----------|-----------------------------------------------------
&lt;C-r&gt;/    | insert last search term
*         | search current word forward     (exact match)
#         | search current word backwards   (exact match)
g*        | search current word(part) forward
g#        | search current word(part) backwards

FZF
---

Install the [silver searcher plugin](https://github.com/ggreer/the_silver_searcher) first if you want to use :Ag command.
    
    yaourt -S the_silver_searcher


Command   | Desciption
----------|----------------------------
Tab       | select current file
ALT-D     | deselect all
ALT-A     | select all
C-T       | open in tab
C-V       | open in vertical split
C-X       | open in split
:Ag       | silver searcher plugin

Clipboard
---------

Install xsel to as clipboard provider. Use plus (+) for selection or star (*) for copied register to access the clipboard.

    :reg        show all registers and stored values
    "+p         paste from plus register (selection)

Filetype: html
--------------

Command   | Description
----------|-----------------------------------
%         | jump to closing/opening tag

Folding
-------

    :setlocal foldlevel=1       level to automatically fold
    :setlocal foldlevelstart=1  level to start folding


Command  |  Description
---------|-------------------------
zO       |  open all nested folds
za       |  toggle fold
zr       |  open all folds
zm       |  close all folds

Emmet
-----

Character | Description
----------|-------------
>         | level down
^         | level up
#foo      | id="foo"
.bar      | class="foo"
*5        | repeat 5 times
$         | index of repeats starting with 1
^         | level up
+         | same level
html:5    | create html 5

### Examples

    div#scrollable>ul>li*5.

    <div id="scrollable">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    

    th>+td.foo$*4>

    <th></th>
    <td class="foo1"></td>
    <td class="foo2"></td>
    <td class="foo3"></td>
    <td class="foo4"></td>
