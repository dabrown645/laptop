gitp() {
    type=${1}
    shift
    comment=${@}
    git ${type} "${comment}"
    git push
}
