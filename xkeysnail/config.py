# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.ENTER,
})

# define_multipurpose_modmap({
#    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
# })

define_keymap(re.compile('Gnome-terminal|Guake|X-terminal-emulator|jetbrains-pycharm-ce'), {
    K('MUHENKAN'): [K('esc'), K('MUHENKAN')]
}, "Esc and IME off")
