package policy.authz

import data.rules.permissions
import input

default allow = false

allow {
    access = permissions[input.user]
    access[_] == input.access
}

whocan[user] {
    access = permissions[user]
    access[_] == input.access
}