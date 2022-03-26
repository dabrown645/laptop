gitp() {
    type=${1}
    shift
    comment=${@}
    git add .
    git ${type} "${comment}"
    git push
}

#https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/roles/base/vars/Archlinux.yml
