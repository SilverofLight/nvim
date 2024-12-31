# Nvim config for personal use

## keymaps

| key          | mode | deac                               |
|--------------|------|------------------------------------|
| jk           | i    | \<Esc\>                            |
| \<C-e\>      | i    | \<Esc\>A                           |
| \<C-a\>      | i    | \<Esc\>I                           |
| \<C-q\>      | i    | enter '\<++\>'                     |
| \<leader\>o  | n    | find and replace next '\<++\>'     |
| \<leader\>i  | n    | find and replace previous '\<++\>' |
| \<leader\>nh | n    | :nohl                              |
| \<leader\>qq | n    | :qall                              |
| \<leader\>wq | n    | :wq                                |
| \<leader\>e  | n,v  | $ (go to end of a line)            |
| \<leader\>a  | n,v  | $ (go to begin of a line)          |
| \<leader\>h  | n    | go to left window                  |
| \<leader\>l  | n    | go to right window                 |
| \<leader\>j  | n    | go to down window                  |
| \<leader\>k  | n    | go to up window                    |
| \<up\>       | n    | resize horizontally                |
| \<down\>     | n    | resize horizontally                |
| \<left\>     | n    | resize vertically                  |
| \<right\>    | n    | resize vertically                  |
| tt           | n    | yazi toggle                        |
| ;            | n    | :                                  |
| tu           | n    | a new tabe                         |
| J            | n    | left tabe                          |
| K            | n    | right tabe                         |
| sp           | n    | toogle spell                       |
| \<leader\>p  | n    | markdown preview                   |
| J            | v    | move a line up                     |
| K            | v    | move a line down                   |
| io           | v    | \<Esc\>                            |
| s            | n    | hop: HopWord                       |
| \<C-j\>      | n,v  | 5j                                 |
| \<C-k\>      | n,v  | 5k                                 |
| \<C-h\>      | n,v  | 8h                                 |
| \<C-l\>      | n,v  | 8l                                 |
| \<leader\>wr | n    | toggle wrap                        |
| \<leader\>us | n    | toggle spell                       |
| \<leader\>gt | n    | open terminal                      |
| \<leader\>p  | n    | markdown preview                   |
| H            | n    | Buffer Prev                        |
| L            | n    | Buffer Next                        |
| \<leader\>bc | n    | Buffer Pick Close                  |
| \<leader\>bp | n    | Buffer Pick                        |
| \<leader\>bd | n    | Buffer Close                       |

#### split:

\<leader\>| : split right

\<leader\>- : split under

#### lsp:

| key          | mode | deac             |
|--------------|------|------------------|
| \<leader\>fm | n    | format           |
| \<leader\>ca | n    | code_action      |
| \<leader\>r  | n    | rename           |
| gd           | n    | go to definition |
| gh           | n    | hover            |

#### telescope:


| key                  | mode | deac                     |
|----------------------|------|--------------------------|
| \<leader\>\<leader\> | n    | find file in current dir |
| \<leader\>fg         | n    | find file in git repo    |
| \<leader\>ff         | n    | find file with content   |
