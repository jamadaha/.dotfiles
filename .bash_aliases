alias downward="~/Programs/downward/fast-downward.py"

gc() {
    git clone git@github.com:jamadaha/$1.git
}

lama() {
    downward --alias lama-first $1 $2
}
