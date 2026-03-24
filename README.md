# vim-change-currentdir

カレントディレクトリをバッファのファイルが存在するディレクトリへ変更する Vim / Neovim プラグインです。

## 概要 / Overview

`:CD` コマンドまたは `<Space>cd` キーマップを使用して、現在編集中のファイルが置かれているディレクトリをカレントディレクトリ（ウィンドウローカル）に設定します。

## バージョン / Versions

このプラグインは Vim 向けの VimScript 版と Neovim 向けの Lua 版の両方を提供しています。

---

## VimScript 版（Vim / Neovim 共通）

### ファイル

```
plugin/changecurrentdir.vim
```

### インストール方法

**vim-plug の場合:**

```vim
Plug 'redtower/vim-change-currentdir'
```

**dein.vim の場合:**

```vim
call dein#add('redtower/vim-change-currentdir')
```

**手動インストール:**

`plugin/changecurrentdir.vim` を Vim の `plugin` ディレクトリへ配置してください。

### 使用方法

| 操作 | 説明 |
|------|------|
| `:CD` | 現在のバッファのファイルが存在するディレクトリへ移動し、移動先を表示する |
| `:CD {dir}` | 指定したディレクトリへ移動し、移動先を表示する |
| `:CD!` | 現在のバッファのファイルが存在するディレクトリへ移動する（表示なし） |
| `<Space>cd` | `:CD` を実行するキーマップ |

**例:**

```vim
" 現在のバッファのディレクトリへ移動
:CD

" 指定ディレクトリへ移動
:CD /path/to/dir

" 移動後のパス表示なし
:CD!
```

---

## Lua 版（Neovim 専用）

### ファイル

```
lua/changecurrentdir.lua
```

### インストール方法

**lazy.nvim の場合:**

```lua
{
  'redtower/vim-change-currentdir',
  config = function()
    require('changecurrentdir')
  end,
}
```

**packer.nvim の場合:**

```lua
use {
  'redtower/vim-change-currentdir',
  config = function()
    require('changecurrentdir')
  end,
}
```

**手動インストール:**

`lua/changecurrentdir.lua` を Neovim の `lua` ディレクトリへ配置し、`init.lua` に以下を追加してください。

```lua
require('changecurrentdir')
```

### 使用方法

VimScript 版と同じコマンド・キーマップが利用できます。

| 操作 | 説明 |
|------|------|
| `:CD` | 現在のバッファのファイルが存在するディレクトリへ移動し、移動先を表示する |
| `:CD {dir}` | 指定したディレクトリへ移動し、移動先を表示する |
| `:CD!` | 現在のバッファのファイルが存在するディレクトリへ移動する（表示なし） |
| `<Space>cd` | `:CD` を実行するキーマップ |

**例:**

```lua
-- init.lua でのロード
require('changecurrentdir')

-- モジュールとして関数を直接呼び出すことも可能
local ccd = require('changecurrentdir')
ccd.change_current_dir('', '')   -- カレントバッファのディレクトリへ移動
ccd.change_current_dir('/path/to/dir', '')  -- 指定ディレクトリへ移動
```

---

## 注意事項 / Notes

- VimScript 版と Lua 版は共存できます。ただし、両方をロードすると `:CD` コマンドと `<Space>cd` キーマップが重複して登録されるため、どちらか一方のみをロードしてください。
- ディレクトリの変更には `lcd`（ウィンドウローカル）を使用しています。`cd`（グローバル）に変更したい場合はソースを修正してください。

## ライセンス / License

MIT
