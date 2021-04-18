package policy.rules

import data.rules.general
import input




allow[msg] {
    input.age <= general.age.min 
    msg := {
        sprintf("La edad debe ser mayor o igual a '%v'", [ general.age.min ]) 
    }
}

allow[msg] {
    input.age >= general.age.max
    msg := {
        sprintf("La edad debe ser menor o igual a '%v'", [ general.age.max ]) 
    }
}


city[msg] {
    not contains(general.city, input.city)
    msg := {
        "allowed": false,
        "message" : "La ciudad ingresada no esta permitida"
    }
}

city[msg] {
    contains(general.city, input.city)
    msg := {
        "allowed": true
    }
}


contains(cities, city) {
  cities[_] = city
}